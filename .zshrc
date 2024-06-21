## Refer to: https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See: https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# See: https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Add clock
RPROMPT='%D{%H:%M:%S}'

# fzf for zsh, like ctrl + r
eval "$(fzf --zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("$HOME/miniconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# nvm completions
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/binutils/bin:$PATH"

# GCLOUD SDK
if [ -d "$HOME/tools/google-cloud-sdk" ]; then
  # The next line updates PATH for the Google Cloud SDK.
  if [ -f '$HOME/tools/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/tools/google-cloud-sdk/path.zsh.inc'; fi

  # The next line enables shell command completion for gcloud.
  if [ -f '$HOME/tools/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/tools/google-cloud-sdk/completion.zsh.inc'; fi

  export USE_GKE_GCLOUD_AUTH_PLUGIN=True

  export PATH=$PATH:$HOME/tools/google-cloud-sdk/bin
  echo "gloud configured"
fi

# Warden
if [ -d "/opt/warden" ]; then
  export PATH="/opt/warden/bin:$PATH"
  export PATH="$HOME/.composer/vendor/bin:$PATH"
  function magexec() { warden env exec php-fpm bin/magento "$@"; }
  function magdexec() { warden env exec php-fpm bin/magento "$@"; }

fi

# Pyenv initialization
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# brew for current user
if [ -d /opt/homebrew ]; then
  if [ "$(stat -f %Su /opt/homebrew)" != "$(whoami)" ]; then
    echo "/opt/homebrew not writable, consider:\n  sudo chown -R $(whoami) /opt/homebrew"
  else
    export ENABLE_PASS_AUTOCOMPLETE=true
  fi
fi

# pass autocompletion
if type brew &>/dev/null && [[ $ENABLE_PASS_AUTOCOMPLETE == true ]]; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# For pip and others
export PATH="$HOME/.local/bin$PATH"

# Misc functions
function flushdns() { sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder }
function chromium() { /Applications/Chromium.app/Contents/MacOS/Chromium --flag-switches-begin --custom-ntp=chrome://version/ --extension-mime-request-handling=always-prompt-for-install --flag-switches-end }

# Source user-specific config(s)
user_config="$HOME/.zshrc_$(whoami)"

if [ -f $user_config ]; then
    source $user_config
    echo "zsh -- sourced user config $USER"
else
    echo "zsh -- no user config to source for $USER"
fi

if [ -f ".zshrc_private" ]; then
    source .zshrc_private
fi

echo "\e[32mcurrent home: $HOME\e[0m"

export ZSH="$HOME/.oh-my-zsh"
plugins=(git)

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export SDKROOT=$(xcrun --sdk macosx --show-sdk-path)
export HOMEBREW_NO_AUTO_UPDATE=1

export JAVA_HOME="$(brew --prefix openjdk@21)"

export PATH="/opt/homebrew/opt/binutils/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$JAVA_HOME/bin:$PATH"

source $ZSH/oh-my-zsh.sh

PROMPT='%(!.%{$fg[red]%}.%{$fg[white]%})%~$(git_prompt_info)%{$reset_color%} > '
RPROMPT='%D{%H:%M:%S}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%})"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"

eval "$(fzf --zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

user_config="$HOME/.zshrc_$(whoami)"
if [ -f $user_config ]; then
    source $user_config
    echo "zsh -- sourced user config $USER"
fi

echo "\e[32mcurrent home: $HOME\e[m"
export PATH="$HOME/.local/bin:$PATH"

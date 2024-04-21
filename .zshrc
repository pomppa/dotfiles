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

# Source user specifc config(s)
source $HOME/.zshrc_$(whoami)
echo "zsh -- sourced user config $USER\ncurrent home: $HOME"

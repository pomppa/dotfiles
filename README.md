# dotfiles

clone & symlink

```
$ git clone --recursive git@github.com:pomppa/dotfiles.git
$ ln -s ~/dotfiles/.zshrc ~/.zshrc
$ ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
$ ln -s ~/dotfiles/.config/nvim ~/.config/nvim
```

extend to source user specific zsh configs

```
$ touch ~/.zshrc_$(whoami)
```

extend private configs

```
$ touch ~/dotfiles/.*_private
```

pull latest and update submodules

```
$ git pull --recurse-submodules
$ git submodule update --init --recursive
```

## tmux

install tmux plugins: `prefix` - `I`

## nvim

external requirements: `git`, `make`, `unzip`, `gcc`, `rg`

### xdebug

https://github.com/xdebug/vscode-php-debug.git

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

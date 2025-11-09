# dotfiles

clone & symlink

```sh
git clone --recursive git@github.com:pomppa/dotfiles.git
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
```

pull latest and update submodules

```sh
git pull --recurse-submodules
git submodule update --init --recursive
```

## tmux

install tmux plugins: `prefix` - `I`

## nvim

external requirements: `git`, `make`, `unzip`, `gcc`, `rg`

## zshrc

- https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template
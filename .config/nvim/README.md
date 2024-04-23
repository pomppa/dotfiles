# kickstart.nvim

## Introduction

A starting point for Neovim modified from https://github.com/nvim-lua/kickstart.nvim

## External Requirements:
- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- Language Setup:
  - If want to write Typescript, you need `npm`
  - If want to write Golang, you will need `go`
  - etc.

## FAQ

* Use [NVIM_APPNAME](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME)`=nvim-NAME`
  to maintain multiple configurations. Install configuration to `~/.config/nvim-kickstart` and create an alias:
  ```
  alias nvim-kickstart='NVIM_APPNAME="nvim-kickstart" nvim'
  ```
* Config directory `~/.config/kickstart-nvim` and matching local directory `~/.local/share/kickstart-nvim`
* See: [lazy.nvim uninstall](https://github.com/folke/lazy.nvim#-uninstalling)
* Modular fork of kickstart:
  * [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim)
    * [Restructure the configuration](https://github.com/nvim-lua/kickstart.nvim/issues/218)
    * [Reorganize init.lua into a multi-file setup](https://github.com/nvim-lua/kickstart.nvim/pull/473)

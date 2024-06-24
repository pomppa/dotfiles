-- [[ Set <space> as leader, before plugins are loaded ]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Disable netrw for nvim-tree or neo-tree, set icons ]]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.have_web_icons = true

-- [[ Setting options ]]
require 'options'

-- [[ Setting keymaps ]]
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-plugins'

-- vim: ts=2 sts=2 sw=2 et

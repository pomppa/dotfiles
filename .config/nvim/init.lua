vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.have_web_icons = true

require 'options'
require 'keymaps'
require 'lazy-bootstrap'
require 'lazy-plugins' -- require('lazy').setup{}

print 'sourced init.lua'

-- vim: ts=2 sts=2 sw=2 et

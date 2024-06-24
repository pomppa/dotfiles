-- Load icons
local ui_config = require 'ui'
-- Disable netrw for nvim-tree or neo-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- See `:hepleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_web_icons = true
-- See `:help vim.opt` / : `help option-list`
vim.opt.syntax = 'on'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'
-- Show which line your cursor is on
vim.opt.cursorline = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
vim.opt.hlsearch = true

-- See `:help vim.keymap.set()`
-- Diagnostic keymaps
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
--vim.keymap.set('n', '<left>', '<cmd>echo "h"<CR>')
--vim.keymap.set('n', '<right>', '<cmd>echo "l"<CR>')
--vim.keymap.set('n', '<up>', '<cmd>echo "k"<CR>')
--vim.keymap.set('n', '<down>', '<cmd>echo "j"<CR>')
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'upper window' })

--  See `:help lua-guide-autocommands`
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { import = 'plugins' },
}, {
  ui_config,
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

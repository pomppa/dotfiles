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
-- vim.opt.clipboard = 'unnamedplus'
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
vim.opt.inccommand = 'split'
vim.opt.cursorline = true

local function apply_cursor_style()
  vim.opt.guicursor = 'n-v-c:block-Cursor/lCursor,i-ci-ve:ver35-iCursor,r-cr:hor25,o:hor50,a:blinkon0'

  -- Keep cursor and cursorline visible on darker themes.
  vim.api.nvim_set_hl(0, 'Cursor', { fg = '#1a1b26', bg = '#ff9e64' })
  vim.api.nvim_set_hl(0, 'lCursor', { fg = '#1a1b26', bg = '#ff9e64' })
  vim.api.nvim_set_hl(0, 'iCursor', { fg = '#1a1b26', bg = '#7aa2f7' })
  vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#2a2f4a' })
end

apply_cursor_style()
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = apply_cursor_style,
})

vim.opt.scrolloff = 10
vim.opt.hlsearch = true
vim.opt.termguicolors = true
vim.opt.ff = 'unix' --opt.fileformat

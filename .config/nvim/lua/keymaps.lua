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

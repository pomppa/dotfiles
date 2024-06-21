return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local api = require 'nvim-tree.api'
    vim.keymap.set('n', '<leader>t', api.tree.toggle, { desc = 'toggle tree' })
    require('nvim-tree').setup {}
  end,
  enabled = false,
}

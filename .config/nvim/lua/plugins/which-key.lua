-- which-key shows a popup of available keybinds after pressing a prefix (e.g. <leader>)
-- Loads on VimEnter: fires after nvim finishes startup — near-instant but doesn't block startup
return {
  {
    'folke/which-key.nvim',
    version = '*',
    event = 'VimEnter',
    config = function()
      local wk = require 'which-key'
      wk.setup()
      -- which-key v3 API: document key groups
      wk.add {
        { '<leader>c', group = 'Code' },
        { '<leader>d', group = 'Document' },
        { '<leader>h', group = 'Git signs' },
        { '<leader>r', group = 'Rename' },
        { '<leader>s', group = 'Search' },
        { '<leader>w', group = 'Workspace' },
      }
    end,
  },
}

return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      --  ci', va), yinq
      require('mini.ai').setup { n_lines = 500 }
      -- require('mini.surround').setup()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_web_icons }
      -- statusline.section_location = function()
      -- return '%2l:%-2v'
      -- end
    end,
  },
}

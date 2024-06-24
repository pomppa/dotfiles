-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  -- ft = 'netrw',
  cmd = 'Neotree',
  --[[
  init = function()
    vim.api.nvim_create_autocmd('BufEnter', {
      -- make a group to be able to delete it later
      group = vim.api.nvim_create_augroup('NeoTreeInit', { clear = true }),
      callback = function()
        local f = vim.fn.expand '%:p'
        if vim.fn.isdirectory(f) ~= 0 then
          vim.cmd('Neotree current dir=' .. f)
          -- neo-tree is loaded now, delete the init autocmd
          vim.api.nvim_clear_autocmds { group = 'NeoTreeInit' }
        end
      end,
    })
    -- keymaps
  end,
  --]]
  keys = {
    { '<C-t>', ':Neotree toggle<CR>', { desc = 'NeoTree toggle' } },
    { '<leader>t', ':Neotree toggle<CR>', { desc = 'NeoTree toggle' } },
    { '<leader>r', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
  },
  opts = {
    follow_current_file = {
      enabled = true,
    },
    filesystem = {
      hijack_netrw_behavior = 'open_default',
      --lazy = true,
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
      },
      window = {
        mappings = {
          -- ['\\'] = 'close_window',
          ['t'] = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.cmd('tabnew ' .. path)
          end,
        },
      },
    },
    buffers = {
      follow_current_file = {
        enabled = true, -- This will find and focus the file in the active buffer every time
        --              -- the current file is changed while the tree is open.
        leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
    },
  },
  init = function()
    vim.api.nvim_create_autocmd('VimEnter', {
      pattern = '*',
      callback = function()
        local buffer = vim.api.nvim_get_current_buf()
        local buf_name = vim.api.nvim_buf_get_name(buffer)
        local is_directory = vim.fn.isdirectory(buf_name) == 1

        if is_directory then
          vim.cmd 'Neotree toggle'
        end
      end,
    })
  end,
}

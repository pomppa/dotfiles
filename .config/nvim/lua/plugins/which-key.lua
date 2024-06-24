-- Useful plugin to show you pending keybinds.
return {
  {
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()
      -- Document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = 'code (which-key)', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = 'document (which-key)', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = 'rename (which-key)', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = 'search (which-key)', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = 'workspace (which-key)', _ = 'which_key_ignore' },
      }
    end,
  },
}

return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  { 'tpope/vim-fugitive' },

  {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('octo').setup {
        suppress_missing_scope = {
          projects_v2 = true,
        },
      }

      vim.keymap.set('n', '<leader>ghi', '<CMD>Octo issue list<CR>', { desc = '[G]it[H]ub [I]ssue List' })
      vim.keymap.set('n', '<leader>ghp', '<CMD>Octo pr list<CR>', { desc = '[G]it[H]ub [P]r List' })

      vim.keymap.set('i', '@', '@<C-x><C-o>', { silent = true, buffer = true, desc = 'Enable completion for GitHub usernames' })
      vim.keymap.set('i', '#', '#<C-x><C-o>', { silent = true, buffer = true, desc = 'Enable completion for GitHub issues' })
    end,
  },
}

return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        leap = true,
        mason = true,
        which_key = true,
        octo = true,
      }

      -- setup must be called before loading
      vim.cmd.colorscheme 'catppuccin'

      -- vim.cmd.hi 'Comment gui=none'
    end,
  },
}

return {
  {
    'ggandor/leap.nvim',
    dependencies = { 'tpope/vim-repeat' },
    config = function()
      -- It' suggested not to set up lazy loading keys as leap manages its own.
      require('leap').create_default_mappings()
    end,
  },
}

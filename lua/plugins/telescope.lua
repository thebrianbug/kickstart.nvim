return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',

        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons' },
      {
        'nvim-telescope/telescope-live-grep-args.nvim',
        version = '^1.0.0',
      },
    },
    config = function()
      local telescope = require 'telescope'
      telescope.setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      pcall(telescope.load_extension, 'fzf')
      pcall(telescope.load_extension, 'ui-select')
      pcall(telescope.load_extension, 'live_grep_args')

      local builtin = require 'telescope.builtin'
      local live_grep_args = require('telescope').extensions.live_grep_args
      local set = vim.keymap.set

      set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      set('n', '<leader>sg', live_grep_args.live_grep_args, { desc = '[S]earch by [G]rep' })
      set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      set('n', '<leader>fb', ':Telescope file_browser<CR>')

      set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
}

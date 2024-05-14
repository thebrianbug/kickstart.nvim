local set = vim.keymap.set

set('n', '<leader>q', '<cmd>q<CR>', { desc = '[Q]uit' })
set('n', '<leader>w', '<cmd>w<CR>', { desc = '[W]rite' })
set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Disable hlsearch ' })
set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
set('n', '<leader>l', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix [L]ist' })

set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

set('n', '<M-,>', '<c-w>5<', { desc = 'Decrease window width' })
set('n', '<M-.>', '<c-w>5>', { desc = 'Increase window width' })
set('n', '<M-t>', '<C-W>+', { desc = 'Resize window [T]aller' })
set('n', '<M-s>', '<C-W>-', { desc = 'Resize window [S]horter' })

-- General Keymaps

-- Tab/buffer management keybinds
local tab_keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
tab_keymap('n', '<C-h>', '<Cmd>BufferPrevious<CR>', opts)
tab_keymap('n', '<C-l>', '<Cmd>BufferNext<CR>', opts)

-- use ctrl+v to paste in insert and command mode
vim.keymap.set("i", "<C-v>", "<C-r>+", { noremap = true })
vim.keymap.set("c", "<C-v>", "<C-r>+", { noremap = true })

-- Close current buffer
vim.keymap.set('n', '<leader>q', ':bd<CR>', { silent = true })

-- Re-order to previous/next
vim.keymap.set('n', '<M-,>', '<Cmd>BufferMovePrevious<CR>', opts)
vim.keymap.set('n', '<M-.>', '<Cmd>BufferMoveNext<CR>', opts)

-- Goto buffer in position...
tab_keymap('n', '<C-1>', '<Cmd>BufferGoto 1<CR>', opts)
tab_keymap('n', '<C-2>', '<Cmd>BufferGoto 2<CR>', opts)
tab_keymap('n', '<C-3>', '<Cmd>BufferGoto 3<CR>', opts)
tab_keymap('n', '<C-4>', '<Cmd>BufferGoto 4<CR>', opts)
tab_keymap('n', '<C-5>', '<Cmd>BufferGoto 5<CR>', opts)
tab_keymap('n', '<C-6>', '<Cmd>BufferGoto 6<CR>', opts)
tab_keymap('n', '<C-7>', '<Cmd>BufferGoto 7<CR>', opts)
tab_keymap('n', '<C-8>', '<Cmd>BufferGoto 8<CR>', opts)
tab_keymap('n', '<C-9>', '<Cmd>BufferGoto 9<CR>', opts)
tab_keymap('n', '<C-0>', '<Cmd>BufferLast<CR>', opts)

-- Clear search highlight on Esc
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>Q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

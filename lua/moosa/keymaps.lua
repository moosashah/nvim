-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)

-- Quick fix list
keymap('n', '<C-Down>', ':cnext<CR>', opts)
keymap('n', '<C-Up>', ':cprev<CR>', opts)
keymap('n', '<leader>qq', ':cclose<CR>', opts)
keymap('n', '<leader>qo', ':copen<CR>', opts)

keymap('n', '<leader>lt', '<cmd>lua TOGGLE_DIAGNOSTICS()<CR>', opts)

-- Center page on scroll
keymap('n', '<C-d>', '<C-d>zz', opts)
keymap('n', '<C-u>', '<C-u>zz', opts)
keymap('n', 'n', 'nzz', opts)
keymap('n', 'N', 'Nzz', opts)

-- Navigate buffers
keymap('n', '<S-l>', vim.cmd.bnext, opts)
keymap('n', '<S-h>', vim.cmd.bprev, opts)

-- Clear highlights
keymap('n', '<leader>h', vim.cmd.nohlsearch, opts)

-- Close buffers
keymap('n', '<S-q>', '<cmd>Bdelete!<CR>', opts)

-- Better paste
keymap('v', 'p', '"_dP', opts)

-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move highlight up and down
keymap('v', 'J', ':m \'>+1 <cr>gv=gv')
keymap('v', 'K', ':m \'<-2 <cr>gv=gv')

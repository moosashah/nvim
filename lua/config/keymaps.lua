local keymap = vim.keymap.set
local opts = { silent = true }

keymap('n', '<leader>ll', vim.cmd.Lazy, opts)
keymap('n', '<leader>lp', '<cmd>Lazy profile<CR>', opts)

vim.keymap.del({ 'n', 'x' }, '[%')
vim.keymap.del({ 'n', 'x' }, ']%')
-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move highlight up and down
keymap('v', 'J', ':m \'>+1 <cr>gv=gv')
keymap('v', 'K', ':m \'<-2 <cr>gv=gv')

-- Better paste
keymap('v', 'p', '"_dP', opts)

-- Better j and k
keymap({ 'n', 'x' }, 'j', 'gj', opts)
keymap({ 'n', 'x' }, 'k', 'gk', opts)

-- Center page on scroll
keymap('n', '<C-d>', '<C-d>zz', opts)
keymap('n', '<C-u>', '<C-u>zz', opts)
keymap('n', 'n', 'nzz', opts)
keymap('n', 'N', 'Nzz', opts)
keymap('n', '*', '*zz', opts)
keymap('n', '#', '#zz', opts)

-- Clear highlights
keymap('n', '<leader>h', vim.cmd.nohlsearch, opts)

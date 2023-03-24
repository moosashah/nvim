-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '

-- Quick fix list
keymap('n', '<C-Down>', ':cnext<CR>', opts)
keymap('n', '<C-Up>', ':cprev<CR>', opts)
keymap('n', '<leader>qq', ':cclose<CR>', opts)
keymap('n', '<leader>qo', ':copen<CR>', opts)

keymap('n', '<Leader>lt', '<cmd>lua TOGGLE_DIAGNOSTICS()<CR>', opts)

-- Center page on scroll
keymap('n', '<C-d>', '<C-d>zz', opts)
keymap('n', '<C-u>', '<C-u>zz', opts)
keymap('n', 'n', 'nzz', opts)
keymap('n', 'N', 'Nzz', opts)

-- Make Executable
keymap('n', '<leader>xx', '<cmd>!chmod +x %<CR', opts)

-- Navigate buffers
keymap('n', '<S-l>', vim.cmd.bnext, opts)
keymap('n', '<S-h>', vim.cmd.bprev, opts)

-- Delete to dev null
keymap({ 'v', 'x' }, '<leader>dd', '"_d<CR>', opts)

-- Clear highlights
keymap('n', '<leader>h', vim.cmd.nohlsearch, opts)

-- Close buffers
keymap('n', '<S-q>', '<cmd>Bdelete!<CR>', opts)

-- Better paste
keymap('v', 'p', '"_dP', opts)

-- Source current file
keymap('n', '<leader><leader>x', '<cmd>lua _SOURCE_FILE()<CR>', opts)

-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move highlight up and down
keymap('v', 'J', ':m \'>+1 <cr>gv=gv')
keymap('v', 'K', ':m \'<-2 <cr>gv=gv')

-- Plugins --

-- Telescope
keymap('n', '<leader>ff', ':Telescope find_files<CR>', opts)
keymap('n', '<leader>fa', ':Telescope find_files hidden=true no_ignore=true<CR>', opts)
keymap('n', '<leader>fs', ':Telescope live_grep<CR>', opts)
keymap('n', '<leader>fk', ':Telescope keymaps<CR>', opts)
keymap('n', '<leader>fr', ':Telescope lsp_references<CR>', opts)
keymap('n', '<leader>fd', ':Telescope diagnostics<CR>', opts)
keymap('n', '<leader>fh', ':Telescope help_tags<CR>', opts)
keymap('n', '<leader>fz', ':Telescope grep_string<CR>', opts)
keymap('n', '<leader>fn', ':Telescope noice<CR>', opts)

-- Nvim-tree
keymap('n', '<leader>fe', vim.cmd.NvimTreeToggle, opts)

-- Comment
keymap('n', '<leader>/', '<cmd>lua require(\'Comment.api\').toggle.current_linewise()<CR>', opts)
keymap('x', '<leader>/', '<ESC><CMD>lua require("Comment.api").toggle.linewise_op(vim.fn.visualmode())<CR>')

--Harpoon
keymap('n', '<leader>ma', '<cmd>lua require"harpoon.mark".add_file()<cr>', opts)
keymap('n', '<leader>mt', '<cmd>lua require"harpoon.ui".toggle_quick_menu()<cr>', opts)
keymap('n', '<C-j>', '<cmd>lua require("harpoon.ui").nav_file(1)<cr>', opts)
keymap('n', '<C-k>', '<cmd>lua require("harpoon.ui").nav_file(2)<cr>', opts)
keymap('n', '<C-l>', '<cmd>lua require("harpoon.ui").nav_file(3)<cr>', opts)
keymap('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>', opts)

-- NeoTest
keymap('n', '<leader>tf', '<cmd>lua require"neotest".run.run()<CR>', opts)
keymap('n', '<leader>ta', '<cmd>lua require"neotest".run()<CR>', opts)
keymap('n', '<leader>ts', '<cmd>lua require"neotest".summary.toggle()<CR>', opts)

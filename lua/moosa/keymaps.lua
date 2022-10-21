-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

function _SOURCE_FILE()
	vim.api.nvim_command [[
  w
  so %
	  ]]
	print 'saved and sourced current file'
end

--Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '

-- Quick fix list
keymap('n', '<C-Down>', ':cnext<CR>', opts)
keymap('n', '<C-Up>', ':cprev<CR>', opts)
keymap('n', '<leader>qq', ':cclose<CR>', opts)
keymap('n', '<leader>qo', ':copen<CR>', opts)

-- Center page on scroll
keymap('n', '<C-d>', '<C-d>zz', opts)
keymap('n', '<C-u>', '<C-u>zz', opts)

-- Make Executable
keymap('n', '<leader>xx', '<cmd>!chmod +x %<CR', opts)

-- Navigate buffers
keymap('n', '<S-l>', ':bnext<CR>', opts)
keymap('n', '<S-h>', ':bprevious<CR>', opts)

-- Delete to dev null
keymap({ 'v', 'x' }, '<leader>dd', '"_d<CR>', opts)

-- Clear highlights
keymap('n', '<leader>h', '<cmd>nohlsearch<CR>', opts)

-- Close buffers
keymap('n', '<S-q>', '<cmd>Bdelete!<CR>', opts)

-- Better paste
keymap('v', 'p', '"_dP', opts)

-- Source current file
keymap('n', '<leader>xs', '<cmd> lua _SOURCE_FILE()<CR>', opts)

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
keymap('n', '<leader>fl', ':Telescope find_files hidden=true no_ignore=true<CR>', opts)
keymap('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
keymap('n', '<leader>fk', ':Telescope keymaps<CR>', opts)
keymap('n', '<leader>fr', ':Telescope lsp_references<CR>', opts)
keymap('n', '<leader>fe', ':Telescope file_browser<CR>', opts)
keymap('n', '<leader>fd', ':Telescope diagnostics<CR>', opts)
keymap('n', '<leader>fh', ':Telescope help_tags<CR>', opts)
keymap('n', '<leader>fz', ':Telescope grep_string<CR>', opts)
keymap('n', '<leader>fn', ':Telescope noice<CR>', opts)

-- Nvim-tree
keymap('n', '<leader>fb', ':NvimTreeToggle<CR>', opts)

-- Git
keymap('n', '<leader>gg', '<cmd>lua _LAZYGIT_TOGGLE()<CR>', opts)
keymap('n', '<leader>go', '<cmd>DiffviewOpen<CR>', opts)
keymap('n', '<leader>gc', '<cmd>DiffviewClose<CR>', opts)

-- Comment
keymap('n', '<leader>/', '<cmd>lua require(\'Comment.api\').toggle.current_linewise()<CR>', opts)
keymap('x', '<leader>/', '<ESC><CMD>lua require("Comment.api").toggle.linewise_op(vim.fn.visualmode())<CR>')

-- DAP
keymap('n', '<leader>db', '<cmd>lua require\'dap\'.toggle_breakpoint()<cr>', opts)
keymap('n', '<leader>dc', '<cmd>lua require\'dap\'.continue()<cr>', opts)
keymap('n', '<leader>di', '<cmd>lua require\'dap\'.step_into()<cr>', opts)
keymap('n', '<leader>do', '<cmd>lua require\'dap\'.step_over()<cr>', opts)
keymap('n', '<leader>dO', '<cmd>lua require\'dap\'.step_out()<cr>', opts)
keymap('n', '<leader>dr', '<cmd>lua require\'dap\'.repl.toggle()<cr>', opts)
keymap('n', '<leader>dl', '<cmd>lua require\'dap\'.run_last()<cr>', opts)
keymap('n', '<leader>du', '<cmd>lua require\'dapui\'.toggle()<cr>', opts)
keymap('n', '<leader>dt', '<cmd>lua require\'dap\'.terminate()<cr>', opts)

--Harpoon
keymap('n', '<leader>mm', '<cmd>lua require"harpoon.mark".add_file()<cr>', opts)
keymap('n', '<leader>mt', '<cmd>lua require"harpoon.ui".toggle_quick_menu()<cr>', opts)
keymap('n', '<C-j>', '<cmd>lua require("harpoon.ui").nav_file(1)<cr>', opts)
keymap('n', '<C-k>', '<cmd>lua require("harpoon.ui").nav_file(2)<cr>', opts)
keymap('n', '<C-l>', '<cmd>lua require("harpoon.ui").nav_file(3)<cr>', opts)
keymap('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>', opts)

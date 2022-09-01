-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

function _SOURCE_FILE()
	vim.api.nvim_command([[
  w
  so %
	  ]])
	print("saved and sourced current file")
end

-- function _MAKE_EXECUTABLE()
-- 	vim.cmd("chmod +x %<cr>")
-- 	print("Current file is now executeable")
-- end

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Quick fix list
keymap("n", "<C-Down>", ":cnext<CR>", opts)
keymap("n", "<C-Up>", ":cprev<CR>", opts)
keymap("n", "<leader>qq", ":cclose<CR>", opts)
keymap("n", "<leader>qo", ":copen<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Source current file
keymap("n", "<leader>xs", "<cmd> lua _SOURCE_FILE()<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move highlight up and down
keymap("v", "J", ":m '>+1 <cr>gv=gv")
keymap("v", "K", ":m '<-2 <cr>gv=gv")

-- Plugins --

-- Telescope
keymap("n", "<leader>pf", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>pt", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>pk", ":Telescope keymaps<CR>", opts)
keymap("n", "<leader>pe", ":Telescope file_browser {hidden=true}<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

--Harpoon
keymap("n", "<leader>mm", '<cmd>lua require"harpoon.mark".add_file()<cr>', opts)
keymap("n", "<leader>mt", '<cmd>lua require"harpoon.ui".toggle_quick_menu()<cr>', opts)
keymap("n", "<leader>mt", '<cmd>lua require"harpoon.ui".toggle_quick_menu()<cr>', opts)
keymap("n", "<C-j>", '<cmd>lua require("harpoon.ui").nav_file(1)<cr>', opts)
keymap("n", "<C-k>", '<cmd>lua require("harpoon.ui").nav_file(2)<cr>', opts)
keymap("n", "<C-l>", '<cmd>lua require("harpoon.ui").nav_file(3)<cr>', opts)
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", opts)

-- Rest-nvim
keymap("n", "<leader>hh", "<Plug>RestNvim", opts)
keymap("n", "<leader>hl", "<Plug>RestNvimLast", opts)
keymap("n", "<leader>hp", "<Plug>RestNvimPreview", opts)

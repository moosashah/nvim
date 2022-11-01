local trouble_status, trouble = pcall(require, 'trouble')
if not trouble_status then
	print 'trouble is not working'
end

trouble.setup()

local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }

keymap('n', '<leader>tt', '<cmd>TroubleToggle<cr>', opts)
keymap('n', '<leader>tw', '<cmd>TroubleToggle workspace_diagnostics<cr>', opts)
keymap('n', '<leader>td', '<cmd>TroubleToggle document_diagnostics<cr>', opts)

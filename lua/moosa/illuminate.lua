vim.g.Illuminate_ftblacklist = { 'alpha', 'NvimTree' }
-- <alt-j> and <alt-k> to go to next_reference
vim.api.nvim_set_keymap('n', '∆', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', { noremap = true })
vim.api.nvim_set_keymap(
	'n',
	'˚',
	'<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>',
	{ noremap = true }
)

vim.g.Illuminate_ftblacklist = { 'alpha', 'NvimTree' }
require('illuminate').configure({
	proviers = {
		'lsp',
		'treesitter',
		'regex',
	},
	filetypes_denylist = {
		'dirvish',
		'fugitive',
		'alpha',
		'NvimTree',
		'neogitstatus',
		'lir',
		'Outline',
		'spectre_panel',
		'DressingSelect',
		'TelescopePrompt',
	},
	under_cursor = true,
})

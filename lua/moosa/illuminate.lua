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
		'packer',
		'neogitstatus',
		'Trouble',
		'lir',
		'Outline',
		'spectre_panel',
		'toggleterm',
		'DressingSelect',
		'TelescopePrompt',
	},
	under_cursor = true,
})

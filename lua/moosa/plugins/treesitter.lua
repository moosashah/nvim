return {
	'nvim-treesitter/nvim-treesitter',
	config = function()
		require('nvim-treesitter.configs').setup({
			ensure_installed = 'all', -- one of "all" or a list of languages
			ignore_install = { 'phpdoc' }, -- List of parsers to ignore installing
			rainbow = {
				enable = true,
				extended_mode = false,
			},
			highlight = {
				enable = true, -- false will disable the whole extension
				disable = { 'css' }, -- list of language that will be disabled
			},
			indent = { enable = true, disable = { 'python', 'css' } },
		})
	end,
	dependencies = {
		{ 'windwp/nvim-ts-autotag' },
		{ 'p00f/nvim-ts-rainbow' },
	},
}

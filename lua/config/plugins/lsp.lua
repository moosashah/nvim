return {
	{
		'williamboman/mason.nvim',
		lazy = false,
		config = true,
	},
	{
		'neovim/nvim-lspconfig',
		cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			'williamboman/mason-lspconfig.nvim',
		},
	},
}

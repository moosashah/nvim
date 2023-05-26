return {
	{
		-- Used everywhere
		{ 'nvim-lua/plenary.nvim' },
		{ 'nvim-tree/nvim-web-devicons' },
        { 'folke/neodev.nvim', config = true },
        { 'https://git.sr.ht/~whynothugo/lsp_lines.nvim', config = true },
        { 'roobert/tailwindcss-colorizer-cmp.nvim', config = true },
        {
            'NvChad/nvim-colorizer.lua',
            opts = { user_default_options = { tailwind = true } },
        },
		{ 'gpanders/editorconfig.nvim' },
		{ 'christoomey/vim-tmux-navigator', event = 'VimEnter' },
	},
}

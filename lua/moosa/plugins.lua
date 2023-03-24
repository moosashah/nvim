local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

require('lazy').setup({
	{ 'wbthomason/packer.nvim' },
	{ 'nvim-lua/plenary.nvim' },
	{ 'windwp/nvim-autopairs' },
	{ 'numToStr/Comment.nvim' },
	{ 'JoosepAlviste/nvim-ts-context-commentstring' },
	{ 'kyazdani42/nvim-web-devicons' },
	{ 'akinsho/bufferline.nvim' },
	{ 'moll/vim-bbye' },
	{ 'nvim-lualine/lualine.nvim' },
	{ 'lukas-reineke/indent-blankline.nvim' },
	{ 'goolord/alpha-nvim' },
	{ 'lewis6991/impatient.nvim' },
	{
		'nvim-neotest/neotest',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-treesitter/nvim-treesitter',
			'antoinemadec/FixCursorHold.nvim',
			'haydenmeade/neotest-jest',
		},
	},

	{ 'kyazdani42/nvim-tree.lua' },
	-- Folke
	{ 'folke/tokyonight.nvim' },
	{ 'folke/neodev.nvim' },
	{
		'folke/noice.nvim',
		event = 'VimEnter',
		dependencies = {
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify',
		},
	},
	{ 'hrsh7th/nvim-cmp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'saadparwaiz1/cmp_luasnip' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'L3MON4D3/LuaSnip' },
	{ 'roobert/tailwindcss-colorizer-cmp.nvim', config = true },
	{ 'simrat39/rust-tools.nvim', config = true },

	{ 'neovim/nvim-lspconfig' },
	{ 'williamboman/nvim-lsp-installer' },
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'jose-elias-alvarez/null-ls.nvim' },
	{ 'RRethy/vim-illuminate' },
	{ 'https://git.sr.ht/~whynothugo/lsp_lines.nvim' },
	{ 'lvimuser/lsp-inlayhints.nvim' },
	{ 'nvim-telescope/telescope.nvim' },
	{ 'nvim-telescope/telescope-file-browser.nvim' },
	{ 'nvim-treesitter/nvim-treesitter' },
	{ 'windwp/nvim-ts-autotag' },
	{ 'p00f/nvim-ts-rainbow' },
	{ 'lewis6991/gitsigns.nvim' },
	{ 'gpanders/editorconfig.nvim' },
	{ 'ThePrimeagen/harpoon' },
	{ 'stevearc/dressing.nvim' },
	{ 'kevinhwang91/nvim-bqf' },
	{ 'NTBBloodbath/rest.nvim' },
	{ 'NvChad/nvim-colorizer.lua', opts = { user_default_options = { tailwind = true } } },
})

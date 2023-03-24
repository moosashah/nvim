-- local fn = vim.fn

-- -- Automatically install packer
-- local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
-- if fn.empty(fn.glob(install_path)) > 0 then
-- 	PACKER_BOOTSTRAP = fn.system({
-- 		'git',
-- 		'clone',
-- 		'--depth',
-- 		'1',
-- 		'https://github.com/wbthomason/packer.nvim',
-- 		install_path,
-- 	})
-- 	print 'Installing packer close and reopen Neovim...'
-- 	vim.cmd [[packadd packer.nvim]]
-- end
--
-- -- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]
--
-- -- Use a protected call so we don't error out on first use
-- local status_ok, packer = pcall(require, 'packer')
-- if not status_ok then
-- 	return
-- end
--
-- -- Have packer use a popup window
-- packer.init({
-- 	display = {
-- 		open_fn = function()
-- 			return require('packer.util').float({ border = 'rounded' })
-- 		end,
-- 	},
-- })
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

-- Install your plugins here
require('lazy').setup({
	{ 'wbthomason/packer.nvim' }, -- Have packer manage itself
	{ 'nvim-lua/plenary.nvim' }, -- Useful lua functions used by lots of plugins
	{ 'windwp/nvim-autopairs' }, -- Autopairs, integrates with both cmp and treesitter
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

	{ 'kyazdani42/nvim-tree.lua' }, -- Nvimtree
	{ 'folke/tokyonight.nvim' }, -- Colorschemes
	-- Folke
	-- ,({ 'folke/todo-comments.nvim' })
	-- ,({ 'folke/persistence.nvim' })
	{ 'folke/neodev.nvim' },
	{ 'folke/trouble.nvim' },
	{
		'folke/noice.nvim',
		event = 'VimEnter',
		dependencies = {
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify',
		},
	},
	-- cmp plugins
	{
		'hrsh7th/nvim-cmp',
	}, -- The completion plugin
	{ 'hrsh7th/cmp-buffer' }, -- buffer completions
	{ 'hrsh7th/cmp-path' }, -- path completions
	{ 'saadparwaiz1/cmp_luasnip' }, -- snippet completions
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'L3MON4D3/LuaSnip' }, -- Snippets
	{ 'roobert/tailwindcss-colorizer-cmp.nvim', config = true },
	{
		'simrat39/rust-tools.nvim',
		config = true,
	},

	{ 'neovim/nvim-lspconfig' }, -- enable LSP
	{ 'williamboman/nvim-lsp-installer' }, -- simple to use language server installer
	{ 'williamboman/mason.nvim' }, -- simple to use language server installer
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'jose-elias-alvarez/null-ls.nvim' }, -- for formatters and linters
	{ 'RRethy/vim-illuminate' },
	{ 'https://git.sr.ht/~whynothugo/lsp_lines.nvim' }, -- Inlay-hints
	{ 'lvimuser/lsp-inlayhints.nvim' },
	{ 'nvim-telescope/telescope.nvim' }, -- Telescope
	{ 'nvim-telescope/telescope-file-browser.nvim' },
	{ 'nvim-treesitter/nvim-treesitter' }, -- Treesitter
	{ 'windwp/nvim-ts-autotag' },
	{ 'p00f/nvim-ts-rainbow' },
	{ 'lewis6991/gitsigns.nvim' }, -- Git
	{ 'sindrets/diffview.nvim' }, -- Diffview
	{ 'gpanders/editorconfig.nvim' }, -- Editorconfig
	{ 'ThePrimeagen/harpoon' }, -- Harpoon
	{ 'stevearc/overseer.nvim' }, -- Overseer
	{ 'stevearc/dressing.nvim' }, -- Dressing
	{ 'kevinhwang91/nvim-bqf' }, -- Better quickfix list
	{ 'NTBBloodbath/rest.nvim' }, -- Rest client
	{
		'NvChad/nvim-colorizer.lua',
		opts = {
			user_default_options = {
				tailwind = true,
			},
		},
	},
})

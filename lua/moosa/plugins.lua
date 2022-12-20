local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	})
	print 'Installing packer close and reopen Neovim...'
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require('packer.util').float({ border = 'rounded' })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use({ 'wbthomason/packer.nvim' }) -- Have packer manage itself
	use({ 'nvim-lua/plenary.nvim' }) -- Useful lua functions used by lots of plugins
	use({ 'windwp/nvim-autopairs' }) -- Autopairs, integrates with both cmp and treesitter
	use({ 'numToStr/Comment.nvim' })
	use({ 'JoosepAlviste/nvim-ts-context-commentstring' })
	use({ 'kyazdani42/nvim-web-devicons' })
	use({ 'akinsho/bufferline.nvim' })
	use({ 'moll/vim-bbye' })
	use({ 'nvim-lualine/lualine.nvim' })
	use({ 'akinsho/toggleterm.nvim' })
	use({ 'lukas-reineke/indent-blankline.nvim' })
	use({ 'goolord/alpha-nvim' })
	use({ 'lewis6991/impatient.nvim' })

	-- nvim-tree
	use({ 'kyazdani42/nvim-tree.lua' })

	-- Colorschemes
	use({ 'folke/tokyonight.nvim' })

	-- Folke
	-- use({ 'folke/todo-comments.nvim' })
	-- use({ 'folke/persistence.nvim' })
	use({ 'folke/neodev.nvim' })
	use({ 'folke/trouble.nvim' })
	use({
		'folke/noice.nvim',
		event = 'VimEnter',
		requires = {
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify',
		},
	})

	-- cmp plugins
	use({ 'hrsh7th/nvim-cmp' }) -- The completion plugin
	use({ 'hrsh7th/cmp-buffer' }) -- buffer completions
	use({ 'hrsh7th/cmp-path' }) -- path completions
	use({ 'saadparwaiz1/cmp_luasnip' }) -- snippet completions
	use({ 'hrsh7th/cmp-nvim-lsp' })

	-- snippets
	use({ 'L3MON4D3/LuaSnip' }) --snippet engine

	-- LSP
	use({ 'neovim/nvim-lspconfig' }) -- enable LSP
	use({ 'williamboman/nvim-lsp-installer' }) -- simple to use language server installer
	use({ 'williamboman/mason.nvim' }) -- simple to use language server installer
	use 'williamboman/mason-lspconfig.nvim'
	use({ 'jose-elias-alvarez/null-ls.nvim' }) -- for formatters and linters
	use({ 'RRethy/vim-illuminate' })
	use({ 'https://git.sr.ht/~whynothugo/lsp_lines.nvim' })

	-- Inlay-hints
	use({ 'lvimuser/lsp-inlayhints.nvim' })

	-- Telescope
	use({ 'nvim-telescope/telescope.nvim' })
	use({ 'nvim-telescope/telescope-file-browser.nvim' })

	-- Treesitter
	use({ 'nvim-treesitter/nvim-treesitter' })
	use({ 'windwp/nvim-ts-autotag' })
	use({ 'p00f/nvim-ts-rainbow' })

	-- Git
	use({ 'lewis6991/gitsigns.nvim' })
	use({ 'sindrets/diffview.nvim' })

	-- Editorconfig
	use({ 'gpanders/editorconfig.nvim' })

	-- Harpoon
	use({ 'ThePrimeagen/harpoon' })

	-- Overseer
	use({ 'stevearc/overseer.nvim' })

	-- Dressing
	use({ 'stevearc/dressing.nvim' })

	-- Better Quickfix
	use({ 'kevinhwang91/nvim-bqf' })

	-- Vim be good
	use({ 'ThePrimeagen/vim-be-good' })

	-- Ray so good
	use({ 's-u-d-o-e-r/vim-ray-so-beautiful' })

	-- Rest
	use({ 'NTBBloodbath/rest.nvim' })

	-- Duck
	use({ 'tamton-aquib/duck.nvim' })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end)

return {
	{
		'williamboman/mason.nvim',
		lazy = false,
		config = true,
	},
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = { 'williamboman/mason.nvim' },
		opts = {
			ensure_installed = { 'gopls', 'lua_ls' },
			automatic_enable = { exclude = { 'ts_ls' } },
		},
	},
	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			'saghen/blink.cmp',
			'williamboman/mason-lspconfig.nvim',
		},
		config = function()
			vim.lsp.config('*', {
				capabilities = require('blink.cmp').get_lsp_capabilities(),
			})

			vim.lsp.config('lua_ls', {
				settings = {
					Lua = {
						runtime = { version = 'LuaJIT' },
						workspace = {
							checkThirdParty = false,
							library = { vim.env.VIMRUNTIME },
						},
					},
				},
			})

			vim.lsp.config('oxlint', {
				cmd = { 'oxlint', '--lsp' },
				filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
				root_markers = { '.oxlintrc.json', 'oxlint.config.ts', 'package.json' },
			})

			vim.lsp.enable({ 'gopls', 'lua_ls', 'oxlint', 'tsgo' })

			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(ev)
					local map = function(mode, lhs, rhs)
						vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, silent = true })
					end
					-- map('n', 'K', vim.lsp.buf.hover)
					map('n', 'gl', vim.diagnostic.open_float)
					-- map('i', '<C-h>', vim.lsp.buf.signature_help)
					-- map('n', '<M-a>', vim.lsp.buf.code_action)
					map('n', '}', function()
						vim.diagnostic.jump({ count = 1 })
					end)
					map('n', '{', function()
						vim.diagnostic.jump({ count = -1 })
					end)
					-- map('n', '<leader>lr', vim.lsp.buf.rename)
					-- map('n', '<leader>lf', function()
					-- 	require('conform').format({ async = false, timeout_ms = 5000 })
					-- end)
					-- map('n', 'gi', vim.lsp.buf.implementation)
					-- map('n', 'gr', vim.lsp.buf.references)
				end,
			})

			vim.diagnostic.config({
				virtual_text = true,
				underline = true,
				update_in_insert = true,
				severity_sort = true,
			})
		end,
	},
}

require('mini.completion').setup({})

vim.lsp.enable({ 'gopls', 'lua_ls', 'ts_ls' })

vim.diagnostic.config({
	virtual_lines = false,
	virtual_text = true,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
	float = {
		border = 'rounded',
		source = false,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = '󰅚 ',
			[vim.diagnostic.severity.WARN] = '󰀪 ',
			[vim.diagnostic.severity.INFO] = '󰋽 ',
			[vim.diagnostic.severity.HINT] = '󰌶 ',
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = 'ErrorMsg',
			[vim.diagnostic.severity.WARN] = 'WarningMsg',
		},
	},
})

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
	callback = function(event)
		local map = function(mode, keys, func)
			vim.keymap.set(mode, keys, func, { buffer = event.buf, silent = true })
		end
		map('n', 'K', vim.lsp.buf.hover)
		map('n', 'gl', vim.diagnostic.open_float)
		map('i', '<C-h>', vim.lsp.buf.signature_help)
		map('n', 'gs', vim.lsp.buf.signature_help)
		map('n', '<M-a>', vim.lsp.buf.code_action)
		map('n', '}', '<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>')
		map('n', '{', '<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>')
		map('n', '<leader>lr', vim.lsp.buf.rename)
		map('n', '<leader>lf', vim.lsp.buf.format)
		map('n', 'gi', vim.lsp.buf.implementation)
		map('n', 'gd', ':Telescope lsp_definitions<CR>')
	end,
})

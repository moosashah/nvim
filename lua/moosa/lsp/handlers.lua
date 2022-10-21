local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_cmp_ok then
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

M.setup = function()
	local icons = require 'moosa.icons'
	local signs = {

		{ name = 'DiagnosticSignError', text = icons.diagnostics.Error },
		{ name = 'DiagnosticSignWarn', text = icons.diagnostics.Warning },
		{ name = 'DiagnosticSignHint', text = icons.diagnostics.Hint },
		{ name = 'DiagnosticSignInfo', text = icons.diagnostics.Information },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
	end

	local config = {
		virtual_text = true,
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = 'minimal',
			border = 'rounded',
			source = 'always',
			header = '',
			prefix = '',
		},
		size = {
			height = 'auto',
			width = 50,
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = 'rounded',
	})

	vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = 'rounded',
	})
end

local function attach_navic(client, bufnr)
	vim.g.navic_silence = true
	local has_navic, navic = pcall(require, 'nvim-navic')
	if not has_navic then
		return
	end
	navic.attach(client, bufnr)
end

local function attach_illumination(client)
	local status_ok, illuminate = pcall(require, 'illuminate')
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	keymap(bufnr, 'n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	keymap(bufnr, 'n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
	keymap(bufnr, 'i', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	keymap(bufnr, 'n', '<leader>li', '<cmd>LspInfo<cr>', opts)
	keymap(bufnr, 'n', '<leader>lI', '<cmd>LspInstallInfo<cr>', opts)
	keymap(bufnr, 'n', 'å', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
	keymap(bufnr, 'n', '<leader>lj', '<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>', opts)
	keymap(bufnr, 'n', '<leader>lk', '<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>', opts)
	keymap(bufnr, 'n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
	keymap(bufnr, 'n', '<leader>lq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
end

M.on_attach = function(client, bufnr)
	local has_formatter = {
		'tsserver',
		'sumneko_lua',
	}
	for _, server in pairs(has_formatter) do
		if client.name == server then
			client.server_capabilities.document_formatting = false
		end

		if client.server_capabilities.documentSymbolProvider then
			attach_navic(client, bufnr)
		end
	end

	lsp_keymaps(bufnr)
	attach_illumination(client)

	-- Format on save
	vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
		group = vim.api.nvim_create_augroup('Format on save', { clear = true }),
		callback = function()
			vim.lsp.buf.format({ async = false })
		end,
	})
end

return M

local status_ok, mason = pcall(require, 'mason')
if not status_ok then
	return
end

local status_ok_1, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status_ok_1 then
	return
end

local servers = {
	'lua_ls',
	'rust_analyzer',
	'tsserver',
	'gopls',
	'tailwindcss',
}

local settings = {
	ui = {
		border = 'rounded',
		icons = {
			package_installed = '◍',
			package_pending = '◍',
			package_uninstalled = '◍',
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require('moosa.lsp.handlers').on_attach,
		capabilities = require('moosa.lsp.handlers').capabilities,
	}

	server = vim.split(server, '@')[1]

	-- if server == 'tsserver' then
	-- 	local tsserver_opts = require 'moosa.lsp.settings.tsserver'
	-- 	opts = vim.tbl_deep_extend('force', tsserver_opts, opts)
	-- end
	--
	-- if server == 'gopls' then
	-- 	local gopls_opts = require 'moosa.lsp.settings.gopls'
	-- 	opts = vim.tbl_deep_extend('force', gopls_opts, opts)
	-- end

	if server == 'lua_ls' then
		local sumneko_opts = require 'moosa.lsp.settings.lua_ls'
		opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
	end

	lspconfig[server].setup(opts)
	-- ::continue::
end

return {
	'stevearc/conform.nvim',
	event = { 'BufWritePre' },
	cmd = { 'ConformInfo' },
	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { 'stylua' },
			javascript = { 'prettierd', 'prettier', stop_after_first = true },
			typescript = { 'prettierd', 'prettier', stop_after_first = true },
			go = { 'gofmt' },
		},
		-- Set default options
		default_format_opts = {
			lsp_format = 'fallback',
		},
		-- Set up format-on-save
		format_on_save = { timeout_ms = 500 },
	},
}

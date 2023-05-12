return {
	'jose-elias-alvarez/null-ls.nvim',
	event = 'InsertLeave',
	config = function()
		local null_ls = require 'null-ls'
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
		local formatting = null_ls.builtins.formatting
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
		local code_actions = null_ls.builtins.code_actions
		local diagnostics = null_ls.builtins.diagnostics

		-- https://github.com/prettier-solidity/prettier-plugin-solidity
		null_ls.setup({
			debug = false,
			sources = {
				formatting.prettier,
				formatting.stylua,
				diagnostics.eslint,
				code_actions.eslint,
			},
		})
	end,
}

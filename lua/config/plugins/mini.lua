return {
	'echasnovski/mini.completion',
	version = false,
	config = function()
		local imap_expr = function(lhs, rhs)
			vim.keymap.set('i', lhs, rhs, { expr = true })
		end
		imap_expr('<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
		imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
		_G.cr_action = function()
			-- If there is selected item in popup, accept it with <C-y>
			if vim.fn.complete_info()['selected'] ~= -1 then
				return '\25'
			end
			-- Fall back to plain `<CR>`. You might want to customize according
			-- to other plugins. For example if 'mini.pairs' is set up, replace
			-- next line with `return MiniPairs.cr()`
			return '\r'
		end

		vim.keymap.set('i', '<CR>', 'v:lua.cr_action()', { expr = true })
	end,
}

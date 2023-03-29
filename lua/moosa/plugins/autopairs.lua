return {
	'windwp/nvim-autopairs',
	config = function()
		local npairs = require 'nvim-autopairs'
		npairs.setup({
			check_ts = true,
			disable_filetype = { 'TelescopePrompt' },
		})
		local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
		require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done({}))
	end,
	disable = true,
}

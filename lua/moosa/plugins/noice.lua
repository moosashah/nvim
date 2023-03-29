return {
	'folke/noice.nvim',
	event = 'VimEnter',
	dependencies = {
		'MunifTanjim/nui.nvim',
		'rcarriga/nvim-notify',
	},
	config = {
		cmdline = {
			format = {
				search_down = { kind = 'search', pattern = '^/', icon = '', lang = 'regex' },
				search_up = { kind = 'search', pattern = '^%?', icon = '', lang = 'regex' },
			},
		},
		routes = {
			{
				filter = {
					event = 'notify',
				},
				opts = { skip = true },
			},
			{
				filter = {
					event = 'msg_show.wmsg',
					kind = '',
					find = 'BOTTOM',
				},
				opts = { skip = true },
			},
			{
				filter = {
					event = 'msg_show',
					kind = '',
				},
				opts = { skip = true },
			},
			{
				view = 'notify',
				filter = { event = 'msg_showmode' },
			},
		},
		views = {
			cmdline_popup = {
				position = {
					row = '50%',
					col = '50%',
				},
				size = {
					width = 60,
					height = 'auto',
				},
			},
		},
		presets = {
			bottom_search = true,
			long_message_to_split = true,
		},
	},
}

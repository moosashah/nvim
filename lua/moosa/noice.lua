local has_telescope, telescope = pcall(require, 'telescope')
if not has_telescope then
	return
end

local has_noice, noice = pcall(require, 'noice')
if not has_noice then
	print 'no noice v sad'
end

local icons = require 'moosa.icons'

noice.setup({
	cmdline = {
		format = {
			search_down = { kind = 'search', pattern = '^/', icon = icons.ui.Search, lang = 'regex' },
			search_up = { kind = 'search', pattern = '^%?', icon = icons.ui.Search, lang = 'regex' },
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
		-- popupmenu = {
		-- 	relative = 'editor',
		-- 	position = {
		-- 		row = 8,
		-- 		col = '50%',
		-- 	},
		-- 	size = {
		-- 		width = 60,
		-- 		height = 10,
		-- 	},
		-- 	border = {
		-- 		style = 'rounded',
		-- 		padding = { 0, 1 },
		-- 	},
		-- 	win_options = {
		-- 		winhighlight = { Normal = 'Normal', FloatBorder = 'DiagnosticInfo' },
		-- 	},
		-- },
	},
	presets = {
		bottom_search = true,
		long_message_to_split = true,
	},
})

telescope.load_extension 'noice'

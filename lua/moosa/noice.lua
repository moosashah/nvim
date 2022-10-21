local has_telescope, telescope = pcall(require, 'telescope')
if not has_telescope then
	return
end

local has_noice, noice = pcall(require, 'noice')
if not has_noice then
	return
end

noice.setup({
	routes = {
		{
			filter = {
				event = 'notify',
				-- kind = '',
				-- find = ' information',
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
				-- find = 'lines',
			},
			opts = { skip = true },
		},
		{
			filter = {
				event = 'cmdline',
				find = '^%s*[/?]',
			},
			view = 'cmdline',
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
		popupmenu = {
			relative = 'editor',
			position = {
				row = '63%',
				col = '50%',
			},
			size = {
				width = 60,
				height = 10,
			},
			border = {
				style = 'rounded',
				padding = { 0, 1 },
			},
			win_options = {
				winhighlight = { Normal = 'Normal', FloatBorder = 'DiagnosticInfo' },
			},
		},
	},
})
telescope.load_extension 'noice'

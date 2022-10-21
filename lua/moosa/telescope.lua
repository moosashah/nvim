local status, telescope = pcall(require, 'telescope')
if not status then
	return
end

local actions = require 'telescope.actions'

telescope.setup({
	defaults = {
		prompt_prefix = ' ',
		selection_caret = ' ',
		dynamic_preview_title = true,
		mappings = {
			i = {
				['<C-n>'] = actions.cycle_history_next,
				['<esc>'] = actions.close,
				['<C-p>'] = actions.cycle_history_prev,
				['<C-j>'] = actions.move_selection_next,
				['<C-k>'] = actions.move_selection_previous,
				['<Down>'] = actions.move_selection_next,
				['<Up>'] = actions.move_selection_previous,
			},
			n = {
				['gg'] = actions.move_to_top,
				['G'] = actions.move_to_bottom,
			},
		},
	},
	extensions = {
		file_browser = {
			initial_mode = 'normal',
			grouped = true,
			path = '%:p:h',
			hidden = true,
			respect_gitignore = false,
		},
	},
	pickers = {
		find_files = {
			find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix' }, --removes the ../ prefix
		},
		buffers = {
			initial_mode = 'normal',
			previewer = false,
			theme = 'dropdown',
			sort_lastused = true,
		},
	},
})

telescope.load_extension 'file_browser'

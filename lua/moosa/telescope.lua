local status, telescope = pcall(require, 'telescope')
if not status then
	return
end

local actions = require 'telescope.actions'

telescope.setup({
	defaults = {
		prompt_prefix = ' ',
		selection_caret = ' ',
		file_ignore_patterns = { 'node_modules', 'yarn.lock', '.yarn/cache', '.git/', 'dist/', '.next/' },
		dynamic_preview_title = true,
		mappings = {
			i = {
				['<C-j>'] = actions.cycle_history_next,
				['<C-k>'] = actions.cycle_history_prev,
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
			hijack_netrw = true,
			hidden = true,
		},
	},
	pickers = {
		find_files = {
			find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix' }, --removes the ../ prefix
			hidden = true,
			no_ignore = true,
		},
	},
})

telescope.load_extension 'file_browser'

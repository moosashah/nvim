local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, 'nvim-tree.config')
if not config_status_ok then
	return
end

local icons = require 'moosa.icons'

local tree_cb = nvim_tree_config.nvim_tree_callback

local notify = require 'nvim-tree.notify'

---@diagnostic disable-next-line: unused-local
local function notify_level(level)
	return function(msg)
		vim.schedule(function()
			vim.api.nvim_echo({ { msg, 'WarningMsg' } }, false, {})
		end)
	end
end

notify.warn = notify_level(vim.log.levels.WARN)
notify.error = notify_level(vim.log.levels.ERROR)
notify.info = notify_level(vim.log.levels.INFO)
notify.debug = notify_level(vim.log.levels.DEBUG)

nvim_tree.setup({
	hijack_directories = {
		enable = false,
	},
	disable_netrw = true,
	hijack_netrw = true,
	filters = {
		custom = { '.git' },
		exclude = { '.gitignore', '.env', '.env.*' },
	},
	hijack_cursor = true,
	update_cwd = true,
	renderer = {
		add_trailing = false,
		group_empty = false,
		highlight_git = false,
		highlight_opened_files = 'none',
		root_folder_modifier = ':t',
		indent_markers = {
			enable = false,
			icons = {
				corner = '└ ',
				edge = '│ ',
				none = '  ',
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = 'before',
			padding = ' ',
			symlink_arrow = ' ➛ ',
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = '',
				symlink = '',
				folder = {
					arrow_open = icons.ui.ArrowOpen,
					arrow_closed = icons.ui.ArrowClosed,
					default = '',
					open = '',
					empty = '',
					empty_open = '',
					symlink = '',
					symlink_open = '',
				},
				git = {
					unstaged = '',
					staged = 'S',
					unmerged = '',
					renamed = '➜',
					untracked = 'U',
					deleted = '',
					ignored = '◌',
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = icons.diagnostics.Hint,
			info = icons.diagnostics.Information,
			warning = icons.diagnostics.Warning,
			error = icons.diagnostics.Error,
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	view = {
		hide_root_folder = false,
		side = 'left',
		mappings = {
			custom_only = false,
			list = {
				{ key = { 'l', '<CR>', 'o' }, cb = tree_cb 'edit' },
				{ key = 'h', cb = tree_cb 'close_node' },
				{ key = 'v', cb = tree_cb 'vsplit' },
			},
		},
		number = false,
		relativenumber = false,
	},
})

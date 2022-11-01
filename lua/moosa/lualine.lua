local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
	return
end

local diagnostics = {
	'diagnostics',
	sources = { 'nvim_diagnostic' },
	colored = true,
	update_in_insert = true,
}

local diff = {
	'diff',
	colored = true,
	symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
}

local filename = {
	'filename',
	path = 3,
}

local noice_mode = require('noice').api.statusline.mode

local recording_macro = {
	noice_mode.get,
	cond = noice_mode.has,
	color = { fg = '#ff9e64' },
}

local filetype = {
	'filetype',
}
local mode = {
	'mode',
}

lualine.setup({
	options = {
		globalstatus = true,
		icons_enabled = true,
		section_separators = { left = '', right = '' },
		theme = 'auto',
		component_separators = { left = '', right = '' },
		disabled_filetypes = { 'alpha', 'dashboard' },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { 'branch' },
		lualine_c = { diagnostics, recording_macro },
		lualine_x = { diff },
		lualine_y = { filetype },
		lualine_z = { filename },
	},
})

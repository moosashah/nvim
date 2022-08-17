local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	'diagnostics',
	sources = { 'nvim_diagnostic' },
	sections = { 'error', 'warn' },
	symbols = { error = ' ', warn = ' ' },
	colored = false,
	always_visible = false,
}

local diff = {
	'diff',
	colored = false,
	symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
	cond = hide_in_width,
}

local filename = {
	'filename',
	path = 3,
}
local filetype = {
	'filetype',
}

lualine.setup({
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = { 'alpha', 'dashboard' },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch' },
		lualine_c = { diagnostics },
		lualine_x = { diff, filetype },
		lualine_y = { filename },
		lualine_z = {},
	},
})

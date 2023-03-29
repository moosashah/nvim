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

local filename = {
	'filename',
	path = 3,
}

lualine.setup({
	options = {
		globalstatus = true,
		icons_enabled = true,
		section_separators = { left = '', right = '' },
		theme = 'auto',
		component_separators = { left = '', right = '' },
		disabled_filetypes = { 'alpha', 'dashboard' },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch' },
		lualine_c = { diagnostics },
		lualine_x = {},
		lualine_y = { 'filetype' },
		lualine_z = { filename },
	},
})

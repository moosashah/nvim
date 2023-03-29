return {
	'nvim-lualine/lualine.nvim',
	config = function()
		local diagnostics = {
			'diagnostics',
			sources = { 'nvim_diagnostic' },
			colored = true,
			update_in_insert = true,
		}

		local filename = {
			'filename',
			-- path = 2,
		}

		require('lualine').setup({
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
	end,
}

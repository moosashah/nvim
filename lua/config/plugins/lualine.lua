return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'AndreM222/copilot-lualine' },
	config = function()
		local lualine = require 'lualine'

		local filename = {
			'filename',
			path = 1,
		}

		local mode = {
			'mode',
			fmt = function(str)
				return str:sub(1, 1)
			end,
		}

		lualine.setup({
			options = {
				globalstatus = true,
				theme = 'catppuccin',
				disabled_filetypes = {
					statusline = { 'alpha', 'dashboard' },
					winbar = { 'alpha', 'dashboard' },
				},
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { filename },
				lualine_c = { 'diagnostics' },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}

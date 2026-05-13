return {
	'nvim-lualine/lualine.nvim',
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

		local lsp = {
			function()
				local clients = vim.lsp.get_clients({ bufnr = 0 })
				if #clients == 0 then
					return 'LSP Inactive'
				end
				local names = {}
				for _, client in ipairs(clients) do
					table.insert(names, client.name)
				end
				return '[' .. table.concat(names, ', ') .. ']'
			end,
			color = { gui = 'bold' },
		}

		lualine.setup({
			options = {
				globalstatus = true,
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
				lualine_z = { lsp },
			},
		})
	end,
}

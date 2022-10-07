return {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
			hint = {
				enable = true,
				arrayIndex = 'Disable', -- "Enable", "Auto", "Disable"
				await = true,
				paramName = 'All', -- "All", "Literal", "Disable"
				paramType = false,
				semicolon = 'Disable', -- "All", "SameLine", "Disable"
				setType = true,
			},
			workspace = {
				library = {
					[vim.fn.expand '$VIMRUNTIME/lua'] = true,
					[vim.fn.stdpath 'config' .. '/lua'] = true,
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

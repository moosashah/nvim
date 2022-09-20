-- local colorscheme = 'onedarker'
local colorscheme = 'tokyonight'

local colorscheme_status_ok, tokyonight = pcall(require, 'tokyonight')
if not colorscheme_status_ok then
	print 'no color scheme sadge'
	return
end

tokyonight.setup({
	style = 'day',
	styles = {
		functions = { italic = true },
		variables = { italic = true },
	},
	sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' },
	day_brightness = 0.5,
	hide_inactive_statusline = true,
	dim_inactive = true,
	on_colors = function(colors)
		colors.hint = colors.orange
		colors.error = '#ff0000'
	end,
})

local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
	return
end

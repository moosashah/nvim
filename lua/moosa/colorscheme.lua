local colorscheme_status_ok, tokyonight = pcall(require, 'tokyonight')
if not colorscheme_status_ok then
	print 'no color scheme sadge'
	return
end

tokyonight.setup({
	style = 'moon',
	styles = {
		functions = { italic = true },
	},
	sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' },
	day_brightness = 0.3,
	hide_inactive_statusline = true,
	dim_inactive = true,
})

function ColorMyPencils(color)
	color = color or 'tokyonight'
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
	vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

ColorMyPencils()

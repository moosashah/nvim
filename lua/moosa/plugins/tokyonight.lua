return {
    'folke/tokyonight.nvim',
    event = 'VimEnter',
    config = {
        sidebars = { 'qf', 'vista_kind', 'terminal', 'lazy' },
        day_brightness = 0.3,
        hide_inactive_statusline = true,
        dim_inactive = true,
        transparent = false,
    },
}

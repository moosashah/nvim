return {
    'folke/tokyonight.nvim',
    enabled = false,
    priority = 1000,
    opts = {
        day_brightness = 0.7,
    },
    lazy = false,
    config = function()
        vim.cmd.colorscheme('tokyonight-moon')
        -- to turn on light mode, enable the autocommand, for some reason I can't set the theme here
    end
}

return {
    'folke/tokyonight.nvim',
    priority = 1000,
    opts = {
        day_brightness = 0.3,
    },
    config = function()
        vim.cmd.colorscheme('tokyonight-moon')
    end
}

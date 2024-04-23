return {
    'folke/tokyonight.nvim',
    priority = 1000,
    opts = {
        day_brightness = 1,
    },
    config = function()
        vim.cmd.colorscheme('tokyonight-moon')
    end
}

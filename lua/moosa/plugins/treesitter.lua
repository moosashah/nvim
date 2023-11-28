return {
    'nvim-treesitter/nvim-treesitter',
    event = 'VimEnter',
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = 'all',
            ignore_install = { 'phpdoc' },
            highlight = {
                enable = true,
                disable = { 'css' },
            },
            indent = { enable = true, disable = { 'python', 'css' } },
            autotag = { enable = true }
        })
    end,
    dependencies = {
        { 'windwp/nvim-ts-autotag' },
        { 'lukas-reineke/indent-blankline.nvim' },
    },
}

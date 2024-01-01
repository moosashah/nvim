return {
    {

        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            { 'windwp/nvim-ts-autotag' },
        },
        config = function()
            local cfg = require('nvim-treesitter.configs')
            cfg.setup({
                auto_install = true,
                highlight = { enable = true },
                autotag = { enable = true },
            })
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-context'
    }
}

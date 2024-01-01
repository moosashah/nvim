return {
    'nvimtools/none-ls.nvim',
    event = 'InsertLeave',
    config = function()
        local null_ls = require 'null-ls'
        local formatting = null_ls.builtins.formatting
        null_ls.setup({
            debug = false,
            sources = {
                formatting.prettier.with({
                    extra_filetypes = { 'astro' },
                }),
                formatting.stylua,
            },
        })
    end,
}

return {
    'RRethy/vim-illuminate',
    config = function()
        require('illuminate').configure({
            filetypes_denylist = {
                'alpha',
                'NvimTree',
                'TelescopePrompt'
            },
        })
    end,
}

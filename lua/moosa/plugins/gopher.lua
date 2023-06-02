return {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()',
    keys = {
        { '<leader>ja', ':GoAddTag<cr>',             silent = true },
        { '<leader>jr', ':GoRmTag<cr>',              silent = true },
        { '<leader>ie', 'o if err != nil { }<esc>i', silent = true },
        { '<C-g>',      ':GoTest<cr>',               silent = true },
    },
}

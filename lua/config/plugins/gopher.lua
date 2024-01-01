return {
    "ray-x/go.nvim",
    dependencies = {
        "ray-x/guihua.lua",
    },
    opts = {},
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()',
    keys = {
        { '<leader>ga', ':GoAddTag json<cr>',           silent = true },
        { '<leader>gr', ':GoRmTag<cr>',                 silent = true },
        { '<leader>ge', 'o if err != nil {<cr>}<esc>O', silent = true },
        { '<C-g>',      ':GoTest<cr>',                  silent = true },
    },
}

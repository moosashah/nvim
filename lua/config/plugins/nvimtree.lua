return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    config = function()
        require("nvim-tree").setup {
            hijack_cursor = true,
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
            view = {
                side = "left",
                width = 50,
                float = {
                    enable = true
                },
            }
        }
    end,
    keys = {
        { '<leader>e', vim.cmd.NvimTreeFindFileToggle }
    }
}

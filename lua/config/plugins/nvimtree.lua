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
                width = {
                    min = 30,
                    max = "80%",
                    padding = 1,
                },
                float = {
                    enable = true,
                    open_win_config = function()
                        local screen_w = vim.opt.columns:get()
                        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                        local w = math.floor(screen_w * 0.8)
                        local h = math.floor(screen_h * 0.8)
                        return {
                            relative = "editor",
                            border = "rounded",
                            width = w,
                            height = h,
                            row = 0,
                            col = 0,
                        }
                    end,
                },
            }
        }
    end,
    keys = {
        { '<leader>e', vim.cmd.NvimTreeFindFileToggle }
    }
}

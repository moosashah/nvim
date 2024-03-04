return {
    'ThePrimeagen/harpoon',
    event = 'VimEnter',
    keys = {
        { '<leader>ma', '<cmd>lua require"harpoon.mark".add_file()<cr>' },
        { '<leader>mt', '<cmd>lua require"harpoon.ui".toggle_quick_menu()<cr>' },
        { '<M-j>',      '<cmd>lua require("harpoon.ui").nav_file(1)<cr>' },
        { '<M-k>',      '<cmd>lua require("harpoon.ui").nav_file(2)<cr>' },
        { '<M-l>',      '<cmd>lua require("harpoon.ui").nav_file(3)<cr>' },
        { '<M-h>',      '<cmd>lua require("harpoon.ui").nav_file(4)<cr>' },
        { '<C-f>',      '<cmd>silent !tmux neww tmux-sessionizer<CR>' },
    },
}

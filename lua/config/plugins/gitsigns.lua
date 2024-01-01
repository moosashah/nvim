return {
    'lewis6991/gitsigns.nvim',
    opts = {
        numhl = true,
    },
    event = 'BufEnter',
    keys = {
        { ']', '<cmd>lua require("gitsigns").next_hunk()<CR>' },
        { '[', '<cmd>lua require("gitsigns").prev_hunk()<CR>' },
    },
}

return {
    'lewis6991/gitsigns.nvim',
    opts = {
        numhl = true,
    },
    event = 'BufEnter',
    keys = {
        { '<M-e>', '<cmd>lua require("gitsigns").next_hunk()<CR>' },
        { '<M-w>', '<cmd>lua require("gitsigns").prev_hunk()<CR>' },
    },
}

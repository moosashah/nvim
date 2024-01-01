return {
    'kevinhwang91/nvim-bqf',
    event = 'BufEnter',
    keys = {
        { '<M-m>', ':cnext<CR>',  silent = true },
        { '<M-,>', ':cprev<CR>',  silent = true },
        { '<M-f>', ':cclose<CR>', silent = true },
        { '<M-d>', ':copen<CR>',  silent = true },
    },
}

return {
    'kevinhwang91/nvim-bqf',
    event = 'BufEnter',
    keys = {
        { '<M-m>', ':cnext<CR>',  silent = true },
        { '<M-,>', ':cprev<CR>',  silent = true },
        { '<M-d>', ':cclose<CR>', silent = true },
        { '<M-f>', ':copen<CR>',  silent = true },
    },
}

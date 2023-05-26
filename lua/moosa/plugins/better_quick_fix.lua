return {
    'kevinhwang91/nvim-bqf',
    event = 'BufEnter',
    keys = {
        { 'µ',  ':cnext<CR>',  silent = true },
        { '≤', ':cprev<CR>',  silent = true },
        { '∂', ':cclose<CR>', silent = true },
        { 'ƒ',  ':copen<CR>',  silent = true },
    },
}

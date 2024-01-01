return {
    'kevinhwang91/nvim-bqf',
    event = 'BufEnter',
    keys = {
        { '<M-m>', ':cnext<CR>', silent = true },
        { '<M-,>', ':cprev<CR>', silent = true },
        -- Using right alt sends the converted keys eg ƒ instead of <A-f> so need to hardcode expected key
        { 'ƒ', ':cclose<CR>', silent = true },
        { '∂', ':copen<CR>', silent = true },
    },
}

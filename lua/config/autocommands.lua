--  Remove statusline and tabline when in Alpha
vim.api.nvim_create_autocmd({ 'user' }, {
    pattern = { 'AlphaReady' },
    callback = function()
        vim.cmd [[
     set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
     set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
     ]]
    end,
})

vim.cmd 'autocmd BufEnter * ++nested if winnr(\'$\') == 1 && bufname() == \'NvimTree_\' . tabpagenr() | quit | endif'

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
    callback = function()
        vim.cmd 'set formatoptions-=cro'
    end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 100 })
    end,
})

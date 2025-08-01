--  Remove statusline and tabline when in Alpha
vim.api.nvim_create_autocmd({ 'user' }, {
    pattern = { 'AlphaReady' },
    callback = function()
        --        vim.cmd("set showtabline=0 | autocmd BufUnload <buffer> set showtabline=0")
        vim.cmd("set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3")
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

vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
    callback = function()
        vim.cmd 'set cursorcolumn'
    end,
})

-- vim.api.nvim_create_autocmd({ 'VimEnter' }, {
--     callback = function()
--         -- vim.cmd 'colorscheme tokyonight-day'
--         -- vim.cmd 'colorscheme tokyonight-day'
--         -- colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
--         -- vim.cmd.colorscheme "catppuccin-latte"
--     end,
-- })

vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
    callback = function()
        vim.cmd 'set nocursorcolumn'
    end,
})


vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { ".env.*" },    -- This will match .env.local, .env.development, etc.
    callback = function()
        vim.bo.filetype = "sh" -- or "bash"
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "Dockerfile.pr" },
    callback = function()
        vim.bo.filetype = "dockerfile"
    end,
})


-- vim.api.nvim_create_autocmd({"LspAttach"},{
--     pattern = {"*"},
--     callback = function()
--         -- Debug: Print all normal mode mappings
--         local maps = vim.api.nvim_buf_get_keymap(0, 'n')
--         for _, map in ipairs(maps) do
--             print(string.format("Found mapping - lhs: %s, rhs: %s", map.lhs, map.rhs))
--             if map.lhs == '[d' or map.lhs == ']d' then
--                 vim.api.nvim_buf_del_keymap(0, 'n', map.lhs)
--             end
--         end

--         -- Debug: Print mappings again after deletion
--         maps = vim.api.nvim_buf_get_keymap(0, 'n')
--         print("After deletion:")
--         for _, map in ipairs(maps) do
--             print(string.format("Found mapping - lhs: %s, rhs: %s", map.lhs, map.rhs))
--         end
--     end
-- })

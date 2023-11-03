---@diagnostic disable: unused-local
return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },
        {
            'williamboman/mason.nvim',
            build = function()
                ---@diagnostic disable-next-line: param-type-mismatch
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        { 'williamboman/mason-lspconfig.nvim' },
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'L3MON4D3/LuaSnip' },
    },
    config = function()
        local lsp = require('lsp-zero').preset({})
        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
            local function keymap(mode, lhs, rhs)
                local opts = { noremap = true, silent = true }
                vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
            end
            keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
            keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
            keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
            keymap('n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>')
            keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
            keymap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
            keymap('i', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
            keymap('n', 'å', '<cmd>lua vim.lsp.buf.code_action()<cr>')
            keymap('n', '}', '<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>')
            keymap('n', '{', '<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>')
            keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>')
            keymap('n', '<leader>lq', '<cmd>lua vim.diagnostic.setloclist()<CR>')
        end)
        lsp.format_on_save({
            format_opts = {
                async = false,
                timeout_ms = 10000,
            },
            servers = {
                ['lua_ls'] = { 'lua' },
                ['null-ls'] = { 'typescript', 'typescriptreact', 'json', 'javascript', 'javascriptreact', 'html', 'astro' },
                ['gopls'] = { 'go', 'gomod', 'gowork', 'gotmpl' }
            }
        })
        local lspconfig = require('lspconfig')
        local util = require('lspconfig/util')

        lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
        lspconfig.eslint.setup({
            settings = {
                packageManager = 'yarn'
            },
            on_attach = function(client, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    command = "EslintFixAll",
                })
            end,
        })
        lspconfig.gopls.setup({
            cmd = { 'gopls' },
            filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
            root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        })
        lspconfig.tailwindcss.setup {}
        vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
        lsp.setup()
    end,
}

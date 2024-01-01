return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            vim.g.lsp_extend_cmp = 0
            vim.g.lsp_extend_lspconfig = 0
        end
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            local lsp = require('lsp-zero')
            lsp.extend_lspconfig()

            lsp.on_attach(function(_, bufnr)
                local function keymap(mode, lhs, rhs)
                    local opts = { noremap = true, silent = true }
                    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
                end
                keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
                keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
                keymap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
                keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
                keymap('n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>')
                keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
                keymap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
                keymap('i', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
                keymap('n', '<M-a>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
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
                    ['null-ls'] = { 'typescript', 'typescriptreact', 'json', 'javascript',
                        'javascriptreact', 'html', 'astro' },
                    ['gopls'] = { 'go', 'gomod', 'gowork', 'gotmpl' }
                }
            })

            require('mason-lspconfig').setup({
                ensure_install = { 'tsserver', "gopls", "lua_ls" },
                handlers = {
                    lsp.default_setup,
                    lua_ls = function()
                        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
                    end,
                    eslint = function()
                        require('lspconfig').eslint.setup(
                            {
                                settings = {
                                    packageManager = 'yarn'
                                },
                                on_attach = function(_, bufnr)
                                    vim.api.nvim_create_autocmd("BufWritePre", {
                                        buffer = bufnr,
                                        command = "EslintFixAll",
                                    })
                                end,

                            }
                        )
                    end,
                }
            })
        end
    },
}

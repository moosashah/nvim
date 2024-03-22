return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        'L3MON4D3/LuaSnip',
        "rafamadriz/friendly-snippets",
        'saadparwaiz1/cmp_luasnip'
    },
    config = function()
        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_cmp()

        require('luasnip.loaders.from_vscode').lazy_load()
        local cmp = require('cmp')
        cmp.event:on('menu_opened', function()
            vim.b.copilot_suggestion_hidden = true
        end)

        cmp.event:on('menu_closed', function()
            vim.b.copilot_suggestion_hidden = false
        end)
        local cmp_action = lsp_zero.cmp_action()
        cmp.setup({
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'nvim_lua' },
                { name = 'path' },
            },
            formatting = lsp_zero.cmp_format(),
            mapping = cmp.mapping.preset.insert({
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<CR>'] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
                ['<Tab>'] = cmp_action.luasnip_supertab(),
                ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
            }),
        })
    end
}

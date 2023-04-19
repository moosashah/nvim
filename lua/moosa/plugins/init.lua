return {
    {
        -- Used everywhere
        { 'nvim-lua/plenary.nvim' },
        { 'kyazdani42/nvim-web-devicons' },
        {
            'neovim/nvim-lspconfig',
            dependencies = {
                { 'williamboman/nvim-lsp-installer' },
                { 'williamboman/mason.nvim' },
                { 'williamboman/mason-lspconfig.nvim' },
                { 'folke/neodev.nvim',                            config = true },
                { 'https://git.sr.ht/~whynothugo/lsp_lines.nvim', config = true },
                { 'roobert/tailwindcss-colorizer-cmp.nvim',       config = true },
                {
                    'NvChad/nvim-colorizer.lua',
                    opts = { user_default_options = { tailwind = true } },
                },
            },
        },
        { 'gpanders/editorconfig.nvim' },
        { 'christoomey/vim-tmux-navigator', event = 'VimEnter' },
    },
}

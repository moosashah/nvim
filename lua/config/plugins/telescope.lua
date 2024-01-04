return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = { 'BurntSushi/ripgrep' },
    config = function()
        local actions = require 'telescope.actions'
        local telescope = require 'telescope'
        telescope.setup({
            defaults = {
                prompt_prefix = ' ',
                selection_caret = ' ',
                dynamic_preview_title = true,
                mappings = {
                    i = {
                        ['<C-n>'] = actions.cycle_history_next,
                        ['<esc>'] = actions.close,
                        ['<C-p>'] = actions.cycle_history_prev,
                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-k>'] = actions.move_selection_previous,
                        ['<M-j>'] = actions.preview_scrolling_down,
                        ['<M-k>'] = actions.preview_scrolling_up,
                        ['<M-h>'] = actions.preview_scrolling_left,
                        ['<M-l>'] = actions.preview_scrolling_right,
                    },
                },
            },
        })
    end,
    keys = {
        { '<c-p>',      ':Telescope find_files<CR>',                            silent = true },
        { '<leader>fa', ':Telescope find_files hidden=true no_ignore=true<CR>', silent = true },
        { '<leader>fs', ':Telescope live_grep<CR>',                             silent = true },
        { '<leader>fk', ':Telescope keymaps<CR>',                               silent = true },
        { '<leader>fr', ':Telescope lsp_references<CR>',                        silent = true },
        { '<leader>fd', ':Telescope diagnostics<CR>',                           silent = true },
        { '<leader>fh', ':Telescope help_tags<CR>',                             silent = true },
        { '<leader>fz', ':Telescope grep_string<CR>',                           silent = true },
    },
}

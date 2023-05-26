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
                        ['<Down>'] = actions.move_selection_next,
                        ['<Up>'] = actions.move_selection_previous,
                    },
                    n = {
                        ['gg'] = actions.move_to_top,
                        ['G'] = actions.move_to_bottom,
                    },
                },
            },
        })
    end,
    keys = {
        { '<leader>ff', ':Telescope find_files<CR>',                           silent = true },
        { '<leader>fa', ':Telescope find_files hidden=true no_ignore=true<CR>' },
        { '<leader>fs', ':Telescope live_grep<CR>' },
        { '<leader>fk', ':Telescope keymaps<CR>' },
        { '<leader>fr', ':Telescope lsp_references<CR>' },
        { '<leader>fd', ':Telescope diagnostics<CR>' },
        { '<leader>fh', ':Telescope help_tags<CR>' },
        { '<leader>fz', ':Telescope grep_string<CR>' },
    },
}

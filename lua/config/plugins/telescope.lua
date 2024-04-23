function FixPath()
    local path = vim.fn.expand('%:p:h')
    local parts = {}
    for part in string.gmatch(path, '([^/]+)') do
        table.insert(parts, part)
    end
    local new_path = "/"
    --/Users/me/project/repo/services|packages|local/module
    for i = 1, 6 do
        new_path = new_path .. parts[i] .. "/"
    end
    print(new_path)
    return new_path
end

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
        {
            '<leader>ff',
            '<cmd>lua  require("telescope.builtin").find_files({ cwd = FixPath() })<cr>',
            silent = true
        },
        { '<leader>fa', ':Telescope find_files hidden=true no_ignore=true<CR>', silent = true },
        { '<leader>fs', ':Telescope live_grep<CR>',                             silent = true },
        { '<leader>ft', ':Telescope live_grep<CR>TODO',                         silent = true },
        { '<leader>fk', ':Telescope keymaps<CR>',                               silent = true },
        { 'gd',         ':Telescope lsp_definitions<CR>',                       silent = true },
        { 'gr',         ':Telescope lsp_references<CR>',                        silent = true },
        { '<leader>fd', ':Telescope diagnostics<CR>',                           silent = true },
        { '<leader>fh', ':Telescope help_tags<CR>',                             silent = true },
        { '<leader>fz', ':Telescope grep_string<CR>',                           silent = true },
    },
}

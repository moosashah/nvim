return {
    'nvim-lualine/lualine.nvim',
    event = 'VimEnter',
    config = function()
        local status_ok, lualine = pcall(require, 'lualine')
        if not status_ok then
            return
        end

        local diagnostics = {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            colored = true,
            update_in_insert = true,
            always_visible = true,
        }

        local filename = {
            'filename',
            path = 1,
        }
        local branch = {
            'branch',
            icon = 'on',
        }

        local mode = {
            'mode',
            fmt = function(str)
                return str:sub(1, 1)
            end,
        }

        lualine.setup({
            options = {
                globalstatus = true,
                icons_enabled = true,
                theme = 'auto',
                disabled_filetypes = { 'alpha', 'dashboard' },
                always_divide_middle = true,
            },
            sections = {
                lualine_a = { mode },
                lualine_b = { branch },
                lualine_c = { filename, diagnostics },
                lualine_x = {},
                lualine_y = { 'filetype' },
                lualine_z = { 'location' },
            },
        })
    end,
}

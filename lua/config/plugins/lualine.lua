return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'AndreM222/copilot-lualine' },
    config = function()
        local lualine = require('lualine')

        local filename = {
            'filename',
            path = 1,
        }

        local mode = {
            'mode',
            fmt = function(str)
                return str:sub(1, 1)
            end,
        }

        local lsp = {
            function()
                local null_ls = require 'null-ls'
                local method_formatting = null_ls.methods.FORMATTING
                local services = {}
                services.list_registered_providers_names = function(filetype)
                    local s = require 'null-ls.sources'
                    local available_sources = s.get_available(filetype)
                    local registered = {}
                    for _, source in ipairs(available_sources) do
                        for m in pairs(source.methods) do
                            registered[m] = registered[m] or {}
                            table.insert(registered[m], source.name)
                        end
                    end
                    return registered
                end

                local formatters = {}
                formatters.list_registered = function(filetype)
                    local registered_providers = services.list_registered_providers_names(filetype)
                    return registered_providers[method_formatting] or {}
                end

                local alternative_methods = {
                    null_ls.methods.DIAGNOSTICS,
                    null_ls.methods.DIAGNOSTICS_ON_OPEN,
                    null_ls.methods.DIAGNOSTICS_ON_SAVE,
                }
                local linters = {}
                linters.list_registered = function(filetype)
                    local registered_providers = services.list_registered_providers_names(filetype)
                    local providers_for_methods = vim.tbl_flatten(vim.tbl_map(function(r)
                        return registered_providers[r] or {}
                    end, alternative_methods))
                    return providers_for_methods
                end
                local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
                if #buf_clients == 0 then
                    return 'LSP Inactive'
                end

                local buf_ft = vim.bo.filetype
                local buf_client_names = {}

                -- add client
                for _, client in pairs(buf_clients) do
                    if client.name ~= 'null-ls' and client.name ~= 'copilot' then
                        table.insert(buf_client_names, client.name)
                    end
                end

                -- add formatter
                local supported_formatters = formatters.list_registered(buf_ft)
                vim.list_extend(buf_client_names, supported_formatters)

                -- add linter
                local supported_linters = linters.list_registered(buf_ft)
                vim.list_extend(buf_client_names, supported_linters)

                local unique_client_names = vim.fn.uniq(buf_client_names)

                local language_servers = '[' .. table.concat(unique_client_names, ', ') .. ']'

                return language_servers
            end,
            color = { gui = 'bold' },
        }

        lualine.setup({
            options = {
                globalstatus = true,
                theme = 'dracula',
                disabled_filetypes = {
                    statusline = { 'alpha', 'dashboard' },
                    winbar = { 'alpha', 'dashboard' }
                },
            },
            sections = {
                lualine_a = { mode },
                lualine_b = { filename },
                lualine_c = { 'diagnostics' },
                lualine_x = { { 'copilot', show_colors = true } },
                lualine_y = {},
                lualine_z = { lsp },
            },
        })
    end,
}

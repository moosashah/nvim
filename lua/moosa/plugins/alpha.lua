return {
    'goolord/alpha-nvim',
    lazy = false,
    config = function()
        local alpha = require 'alpha'
        local dashboard = require 'alpha.themes.dashboard'
        dashboard.section.header.val = {
            [[                               __                ]],
            [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
            [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
            [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
            [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
            [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
        }
        dashboard.section.buttons.val = {
            dashboard.button('f', ' ' .. ' Find file', ':Telescope find_files <CR>'),
            dashboard.button('s', ' ' .. ' Find text', ':Telescope live_grep <CR>'),
            dashboard.button('e', ' ' .. ' Open NvimTree', ':NvimTreeToggle<CR>'),
            dashboard.button('q', ' ' .. ' Quit', ':qa<CR>'),
        }
        dashboard.section.header.opts.hl = 'Include'
        dashboard.section.buttons.opts.hl = 'Keyword'
        dashboard.opts.opts.noautocmd = true
        alpha.setup(dashboard.opts)
    end,
}

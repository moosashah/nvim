return {
    'nvim-neotest/neotest',
    event = 'VeryLazy',
    dependencies = {
        'antoinemadec/FixCursorHold.nvim',
        'haydenmeade/neotest-jest',
    },
    config = function()
        local neotest = require 'neotest'
        local neotest_jest = require 'neotest-jest'
        neotest.setup({
            adapters = {
                neotest_jest,
            },
            icons = {
                passed = '',
                failed = '',
                running = '',
                skipped = '',
            },
        })
    end,
    -- TODO: Need to figure out keybindings
    keys = {
        { '<leader>tf', '<cmd>lua require"neotest".run.run()<CR>' },
        { '<leader>ta', '<cmd>lua require"neotest".run()<CR>' },
        { '<leader>ts', '<cmd>lua require"neotest".summary.toggle()<CR>' },
    },
}

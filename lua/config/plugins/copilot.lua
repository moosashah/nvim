return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
        suggestion = { enabled = false },
        panel = { enabled = false }
    },
    dependencies = {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end
    }
}

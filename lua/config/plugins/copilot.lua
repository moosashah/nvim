return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
        suggestion = {
            auto_trigger = true,
            keymap = {
                accept = "<M-f>",
                accept_word = "<M-w>",
                accept_line = "<M-l>",
                next = "<M-j>",
                prev = "<M-k>",
                dismiss = "<M-e>",
            },
        },
        panel = { enabled = false }
    },
}

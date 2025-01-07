return {
    -- <https://github.com/zbirenbaum/copilot.lua>
    {
        "zbirenbaum/copilot.lua",
        opts = {
            suggestion = {
                enabled = true, -- Enable inline suggestions
                auto_trigger = true, -- Auto-trigger suggestions
                debounce = 75, -- Debounce for responsiveness
                keymap = {
                    accept = "<C-J>", -- Accept suggestion
                    next = "<M-]>",
                    prev = "<M-[>",
                    dismiss = "<C-K>", -- Dismiss suggestion
                },
            },
            panel = {
                enabled = true, -- Enable Copilot panel
                keymap = {
                    jump_next = "<C-n>",
                    jump_prev = "<C-p>",
                    accept = "<CR>",
                    refresh = "gr",
                },
            },
            filetypes = {
                ["*"] = true, -- Enable Copilot for all filetypes
                markdown = true,
                help = true,
            },
        },
        config = function(_, opts)
            require("copilot").setup(opts)
        end,
    },
    -- Integration with nvim-cmp
    {
        "zbirenbaum/copilot-cmp",
        dependencies = { "zbirenbaum/copilot.lua" },
        opts = {},
        config = function(_, opts)
            require("copilot_cmp").setup(opts)
        end,
    },
}

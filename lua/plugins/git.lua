return {
    -- <https://github.com/kdheepak/lazygit.nvim>
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "f-person/git-blame.nvim",
        init = function()
            require("gitblame").setup({
                enabled = false,
            })
            vim.g.gitblame_display_virtual_text = 1
            -- vim.g.gitblame_enabled = 0
        end,
    },
    -- <https://github.com/zbirenbaum/copilot.lua>
    {
        "zbirenbaum/copilot.lua",
        opts = {},
    },
    -- Integration with nvim-cmp
    {
        "zbirenbaum/copilot-cmp",
        dependencies = { "zbirenbaum/copilot.lua" },
        opts = {},
    },
    --pre-commit.nvim
    { -- TODO: Troubleshoot this plugin
        "ttibsi/pre-commit.nvim",
    },
}

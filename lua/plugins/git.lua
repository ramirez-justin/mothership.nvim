return {
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        opts = {},
    },
    {
        "f-person/git-blame.nvim",
        cmd = { "GitBlameToggle", "GitBlameEnable", "GitBlameDisable" },
        init = function()
            require("gitblame").setup({
                enabled = false,
            })
            vim.g.gitblame_display_virtual_text = 1
        end,
    },
    {
        "ttibsi/pre-commit.nvim",
        cmd = "Precommit",
    },
}

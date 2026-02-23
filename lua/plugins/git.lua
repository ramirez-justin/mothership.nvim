return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
    },
    {
        "f-person/git-blame.nvim",
        cmd = { "GitBlameToggle", "GitBlameEnable", "GitBlameDisable" },
        opts = {
            enabled = false,
            display_virtual_text = true,
        },
    },
    {
        "ttibsi/pre-commit.nvim",
        cmd = "Precommit",
    },
}

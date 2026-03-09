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
    {
        "pwntester/octo.nvim",
        cmd = "Octo",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            { "<leader>go", "<cmd>Octo pr list<cr>", desc = "Octo PR List" },
        },
        opts = {
            picker = "snacks",
        },
    },
}

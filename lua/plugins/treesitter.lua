return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup()
            require("nvim-treesitter").install({
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "sql",
                "rust",
                "python",
                "json",
                "java",
                "toml",
                "terraform",
                "hcl",
                "markdown",
                "markdown_inline",
                "bash",
                "typescript",
                "javascript",
                "css",
                "yaml",
            })
        end,
    },
}

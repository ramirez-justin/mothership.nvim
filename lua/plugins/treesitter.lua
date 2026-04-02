return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").install({
                "bash", "c", "css", "hcl", "html", "java",
                "javascript", "json", "lua", "markdown", "markdown_inline",
                "python", "query", "rust", "scss", "sql", "svelte",
                "terraform", "toml", "typescript", "typst", "vim",
                "vimdoc", "vue", "yaml",
            })
        end,
    },
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup()

            require("nvim-treesitter").install({
                "bash", "c", "css", "hcl", "html", "java",
                "javascript", "json", "lua", "markdown", "markdown_inline",
                "python", "query", "rust", "scss", "sql", "svelte",
                "terraform", "toml", "typescript", "typst", "vim",
                "vimdoc", "vue", "yaml",
            })

            -- Treesitter highlighting (now built into Neovim, not the plugin)
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "bash", "c", "css", "hcl", "html", "java",
                    "javascript", "json", "lua", "markdown", "markdown_inline",
                    "python", "query", "rust", "scss", "sql", "svelte",
                    "terraform", "toml", "typescript", "typst", "vim",
                    "vimdoc", "vue", "yaml",
                },
                callback = function() vim.treesitter.start() end,
            })
        end,
    },
}

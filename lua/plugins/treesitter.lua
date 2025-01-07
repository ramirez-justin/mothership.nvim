return {
    {
        -- Treesitter Plugin
        "nvim-treesitter/nvim-treesitter",
        dependencies = "nvim-treesitter/playground",
        opts = {
            ensure_installed = {
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
            },                                 -- A list of languages to install
            sync_install = false,              -- Install parsers synchronously
            auto_install = true,               -- Automatically install missing parsers
            highlight = {
                enable = true,                 -- Enable syntax highlighting
                additional_vim_regex_highlighting = false, -- Use Treesitter only for highlighting
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}

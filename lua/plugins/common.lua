return {
    -- <https://github.com/folke/neoconf.nvim>
    { -- a Neovim plugin to manage global and project-local settings.
        "folke/neoconf.nvim",
        opts = {},
        cmd = { "NeoConf" },
    },
    -- Tip: You can force enable/disable lazydev in certain project folders using :h
    -- 'exrc' with vim.g.lazydev_enabled = true or vim.g.lazydev_enabled = false
    -- <https://github.com/folke/lazydev.nvim>
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    -- <https://github.com/hrsh7th/nvim-cmp>
    { -- optional cmp completion source for require statements and module annotations
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = "lazydev",
                group_index = 0, -- set group index to 0 to skip loading LuaLS completions
            })
        end,
    },
}

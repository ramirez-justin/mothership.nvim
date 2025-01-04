-- <https://github.com/folke/which-key.nvim>
return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- TODO: Add icons to the keymap which do not have any
            spec = {
                -- [1]: (string) lhs (required),
                -- [2]: (string|fun()) rhs (optional): when present, it will create the mapping
                -- desc: (string|fun():string) description (required for non-groups)
                -- group: (string|fun():string) group name (optional)
                -- mode: (string|string[]) mode (optional, defaults to "n")
                -- cond: (boolean|fun():boolean) condition to enable the mapping (optional)
                -- hidden: (boolean) hide the mapping (optional)
                -- icon: (string|wk.Icon|fun():(wk.Icon|string)) icon spec (optional)
                -- proxy: (string) proxy to another mapping (optional)
                -- expand: (fun():wk.Spec) nested mappings (optional)
                -- any other option valid for vim.keymap.set
                { "<leader>d",  desc = "Dashboard" },
                { "<leader>e",  ":NvimTreeToggle<cr>",                        desc = "Toggle NVIM Tree" },
                { "<leader>f",  group = "Telescope" },
                { "<leader>fb", "<cmd>Telescope buffers<cr>",                 desc = "Buffers" },
                { "<leader>ff", "<cmd>Telescope find_files<cr>",              desc = "Find File" },
                { "<leader>fg", "<cmd>Telescope git_files<cr>",               desc = "Git Files" },
                { "<leader>fr", "<cmd>Telescope oldfiles<cr>",                desc = "Open Recent File", remap = true },
                { "<leader>fs", "<cmd>Telescope live_grep<cr>",               desc = "Live Grep" },
                { "<leader>g",  group = "Lazygit" },
                { "<leader>gg", "<cmd>LazyGit<cr>",                           desc = "Open LazyGit",     remap = true },
                { "<leader>h",  "<cmd>noh<cr>",                               desc = "Remove Highlights" },
                { "<leader>q",  "<cmd>q<cr>",                                 desc = "Quit" },
                { "<leader>r",  desc = "Rename" },
                { "<leader>t",  group = "Compiler/Change" },
                { "<leader>tc", "<cmd>CompilerToggleResults<cr>",             desc = "Toggle Results" },
                { "<leader>to", "<cmd>CompilerOpen<cr>",                      desc = "Open Compiler" },
                { "<leader>tr", "<cmd>CompilerStop<cr><cmd>CompilerRedo<cr>", desc = "Redo Last Option" },
                { "<leader>w",  "<cmd>w<cr>",                                 desc = "Write File" },
                { "<leader>z",  desc = "Undotree" },
            },
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
}

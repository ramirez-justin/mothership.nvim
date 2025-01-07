return {
    -- <https://github.com/nvim-lualine/lualine.nvim>
    {
        { "nvim-lualine/lualine.nvim" },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = function(_, opts)
            opts.options = {
                icons_enabled = true,
                theme = "auto",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = { "NvimTree" },
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 300,
                    tabline = 300,
                    winbar = 300,
                },
            }
            opts.sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "filename" },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            }
            opts.inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            }
        end,
    },
    -- <https://github.com/nvim-telescope/telescope.nvim>
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        -- or tag = '0.1.8',
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-ui-select.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            { "nvim-telescope/telescope-dap.nvim" },
            {
                "jmbuhr/telescope-zotero.nvim",
                enabled = true,
                dev = false,
                dependencies = {
                    { "kkharji/sqlite.lua" },
                },
                config = function()
                    vim.keymap.set("n", "<leader>fz", ":Telescope zotero<cr>", { desc = "[z]otero" })
                end,
            },
        },
        opts = function(_, opts)
            local actions = require("telescope.actions")
            local trouble = require("trouble.providers.telescope")

            -- Merge your custom options into the opts table
            opts.defaults = {
                mappings = {
                    i = {
                        ["<C-n>"] = actions.cycle_history_next,
                        ["<C-p>"] = actions.cycle_history_prev,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                        ["<C-c>"] = actions.close,
                        ["<C-t>"] = trouble.open_with_trouble,
                    },
                    n = {
                        ["<C-n>"] = actions.cycle_history_next,
                        ["<C-p>"] = actions.cycle_history_prev,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                        ["<C-c>"] = actions.close,
                        ["<C-t>"] = trouble.open_with_trouble,
                    },
                },
            }
            opts.pickers = {
                -- Add picker-specific configurations here if needed
            }
            opts.extensions = {
                fzf = {},
            }
        end,
        config = function(_, opts)
            local telescope = require("telescope")
            telescope.setup(opts)

            -- Load extensions
            telescope.load_extension("recent_files")
            telescope.load_extension("noice")
        end,
    },
    { -- Highlight todo, notes, etc in comments
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { signs = false },
    },
    -- <https://github.com/dstein64/nvim-scrollview>
    { -- scrollbar
        "dstein64/nvim-scrollview",
        enabled = true,
        opts = {
            current_only = true,
        },
    },
}

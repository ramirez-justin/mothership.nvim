-- <https://github.com/nvim-telescope/telescope.nvim>
return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    -- or tag = '0.1.8',
    dependencies = { "nvim-lua/plenary.nvim" },
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
            -- Configure extensions if required
        }
    end,
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)

        -- Load extensions
        telescope.load_extension("recent_files")
        telescope.load_extension("noice")
    end,
}

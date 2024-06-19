-- Telescope
local telescope = require("telescope")
local actions = require("telescope.actions")
local trouble = require("trouble.sources.telescope")

telescope.setup{
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- Cycle through history
                ["C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
                -- Move up and down through the list
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                -- Send to quickfix list
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                ["<C-c>"] = actions.close,
                ["<C-t>"] = trouble.open,
            },
            n = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                ["<C-c>"] = actions.close,
                ["<C-t>"] = trouble.open,
            },
        }
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
            --   picker_config_key = value,
            --   ...
            -- }
            -- Now the picker_config_key will be applied every time you call this
            -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
            --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    }
}

-- Extensions
telescope.load_extension("recent_files")
telescope.load_extension("noice")
-- telescope.load_extension('dbtpal')

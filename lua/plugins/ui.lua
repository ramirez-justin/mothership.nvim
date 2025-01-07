return {
    -- <https://github.com/nvim-lualine/lualine.nvim>
    { -- A blazing fast and easy to configure Neovim statusline written in Lua.
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
    -- <https://github.com/folke/noice.nvim>
    { -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = function(_, opts)
            opts.setup = {
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
                        ["vim.lsp.util.stylize_markdown"] = false,
                        ["cmp.entry.get_documentation"] = false, -- requires hrsh7th/nvim-cmp
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = false, -- use a classic bottom cmdline for search
                    command_palette = true, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false, -- add a border to hover docs and signature help
                },
            }
        end,
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            {
                "rcarriga/nvim-notify",
                opts = function(_, opts)
                    opts.setup = {
                        stages = "fade_in_slide_out",
                        timeout = 5000,
                    }
                end,
            },
        },
    },
    -- <https://github.com/nvim-telescope/telescope.nvim>
    { -- Gaze deeply into unknown regions using the power of the moon.
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        -- or tag = '0.1.8',
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-ui-select.nvim" },
            { "smartpde/telescope-recent-files" },
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
    { -- a Neovim plugin that displays interactive vertical scrollbars and signs.
        "dstein64/nvim-scrollview",
        enabled = true,
        opts = {
            current_only = true,
        },
    },
    -- <https://github.com/folke/which-key.nvim>
    { --  helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type.
        "folke/which-key.nvim",
        event = "VeryLazy",
        enabled = true,
        config = function()
            require("which-key").setup({})
            require("config.keymaps")
        end,
    },
    -- <https://github.com/KostkaBrukowa/definition-or-references.nvim>
    { -- Definition-or-references.nvim: JetBrains like definition and references handling
        "KostkaBrukowa/definition-or-references.nvim",
    },
}

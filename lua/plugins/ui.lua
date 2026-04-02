return {
    -- <https://github.com/nvim-lualine/lualine.nvim>
    { -- A blazing fast and easy to configure Neovim statusline written in Lua.
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { { "filename", path = 3 } },
                lualine_x = { "filetype" },
                lualine_y = { "progress" },
                lualine_z = {},
            },
            inactive_sections = {
                lualine_c = { { "filename", path = 3 } },
                lualine_x = { "location" },
            },
        },
    },

    { -- Highlight todo, notes, etc in comments
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { signs = false },
    },
    -- <https://github.com/dstein64/nvim-scrollview>
    { -- a Neovim plugin that displays interactive vertical scrollbars and signs.
        "dstein64/nvim-scrollview",
        opts = {
            current_only = true,
        },
    },

    -- <https://github.com/folke/which-key.nvim>
    { --  helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type.
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
        config = function(_, opts)
            require("which-key").setup(opts)
            require("config.keymaps")
        end,
    },

    -- <https://github.com/akinsho/bufferline.nvim>
    { -- A snazzy buffer line (with tabpage integration) for Neovim built using lua.
        "akinsho/bufferline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {
            options = {
                close_command = "bdelete! %d",
                numbers = "none",
                right_mouse_command = nil,
                left_mouse_command = "buffer %d",
                middle_mouse_command = nil,
                indicator = {
                    icon = "▎",
                    style = "icon",
                },
                buffer_close_icon = "",
                modified_icon = "●",
                close_icon = "",
                left_trunc_marker = "",
                right_trunc_marker = "",
                max_name_length = 18,
                max_prefix_length = 15,
                tab_size = 10,
                diagnostics = false,
                custom_filter = function(bufnr)
                    local exclude_ft = { "qf", "fugitive", "git" }
                    local cur_ft = vim.bo[bufnr].filetype
                    return not vim.tbl_contains(exclude_ft, cur_ft)
                end,
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                show_close_icon = true,
                show_tab_indicators = true,
                separator_style = "slant",
                enforce_regular_tabs = false,
                always_show_bufferline = true,
                sort_by = "id",
            },
            highlights = {
                fill = {
                    bg = {
                        attribute = "fg",
                        highlight = "Pmenu",
                    },
                },
            },
        },
    },

    -- <https://github.com/folke/noice.nvim>
    { -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            -- Disable noice's notify - using Snacks.notifier instead
            notify = {
                enabled = false,
            },
            presets = {
                bottom_search = false,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = false,
            },
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
    },
}

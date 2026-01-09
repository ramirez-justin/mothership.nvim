return {
    -- <https://github.com/nvim-lualine/lualine.nvim>
    { -- A blazing fast and easy to configure Neovim statusline written in Lua.
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                icons_enabled = true,
                theme = "auto",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
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
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { { "filename", path = 3 } },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = {},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
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
        enabled = true,
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
        config = function()
            require("config.keymaps")
        end,
    },

    -- <https://github.com/akinsho/bufferline.nvim>
    { -- A snazzy 💅 buffer line (with tabpage integration) for Neovim built using lua.
        "akinsho/bufferline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {
            options = {
                close_command = "bdelete! %d",
                number = false,
                right_mouse_command = nil,
                left_mouse_command = "buffer %d",
                middle_mouse_command = nil,
                indicator = {
                    icon = "▎", -- This should be omitted if indicator style is not 'icon'
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
                    -- Filter out specific filetypes
                    local exclude_ft = { "qf", "fugitive", "git" }
                    local cur_ft = vim.bo[bufnr].filetype
                    return not vim.tbl_contains(exclude_ft, cur_ft)
                end,
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                show_close_icon = true,
                show_tab_indicators = true,
                persist_buffer_sort = false, -- Whether or not custom sorted buffers should persist
                separator_style = "slant",
                enforce_regular_tabs = false,
                always_show_bufferline = true,
                sort_by = "id",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true, -- Use "true" to enable the default, or set your own character
                    },
                },
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

    -- <https://github.com/numToStr/Comment.nvim>
    { -- ⚡ Smart and Powerful commenting plugin for neovim ⚡
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup() -- Simple setup without defining keymaps here
        end,
        event = "BufReadPost",         -- Optional lazy-load on buffer read
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
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = false,        -- use a classic bottom cmdline for search
                command_palette = true,       -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false,       -- add a border to hover docs and signature help
            },
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            -- nvim-notify removed - using Snacks.notifier instead
        },
    },

    -- Undotree removed - using Snacks.picker.undo() at <leader>su instead
}

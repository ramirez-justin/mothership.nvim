-- <https://github.com/akinsho/bufferline.nvim>
return {
    { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
    opts = function(_, opts)
        -- Merge your custom configuration into `opts`
        opts.options = {
            close_command = "bdelete! %d",
            number = false,
            right_mouse_command = nil,
            left_mouse_command = "buffer %d",
            middle_mouse_command = nil,
            indicator = {
                icon = "▎", -- This should be omitted if indicator style is not 'icon'
                style = "icon",
            },
            buffer_close_icon = "",
            modified_icon = "●",
            close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
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
        }
        opts.highlights = {
            fill = {
                bg = {
                    attribute = "fg",
                    highlight = "Pmenu",
                },
            },
        }
    end,
}

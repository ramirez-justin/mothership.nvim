return {
    {
        -- <https://github.com/EdenEast/nightfox.nvim>
        "EdenEast/nightfox.nvim",
        lazy = false, -- Load immediately
        priority = 1000, -- Ensure it loads first
        config = function()
            require("nightfox").setup({
                options = {
                    transparent = false, -- Disable background
                    terminal_colors = true, -- Set terminal colors
                    dim_inactive = true, -- Dim inactive windows
                    styles = {
                        comments = "italic",
                        keywords = "bold",
                        functions = "italic,bold", -- Style for functions
                        types = "italic,bold",
                    },
                    inverse = {
                        match_paren = true, -- Invert the highlighting for match parens
                    },
                    modules = {
                        -- Enable plugin integrations
                        telescope = true,
                        nvimtree = true,
                        cmp = true,
                        gitsigns = true,
                        lsp_trouble = true,
                        whichkey = true,
                    },
                },
                palettes = {},
                groups = {
                    duskfox = {
                        CursorLine = { bg = "#3a3f4b" }, -- Highlight for current line
                        Visual = { bg = "#4b5263" },  -- Visual mode highlight
                        LineNr = { fg = "#5eacd3" },  -- Line numbers in blue
                        Comment = { fg = "#7986cb", style = "italic" }, -- Comments in blue-purple
                    },
                },
            })
            -- Load the theme
            vim.cmd("colorscheme duskfox")
        end,
    },
}

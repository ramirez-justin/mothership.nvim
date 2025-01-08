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
    -- {
    --     -- <https://github.com/marko-cerovac/material.nvim>
    --     "marko-cerovac/material.nvim",
    --     lazy = false, -- Load immediately
    --     priority = 1000, -- Ensure it loads first
    --     config = function()
    --         -- Set the material style
    --         vim.g.material_style = "deep ocean" -- Change to your preferred style
    --
    --         -- Load the theme with your configuration
    --         require("material").setup({
    --             contrast = {
    --                 terminal = false,
    --                 sidebars = false,
    --                 floating_windows = false,
    --                 cursor_line = false,
    --                 non_current_windows = false,
    --                 filetypes = {},
    --             },
    --             styles = {
    --                 comments = { italic = true },
    --                 keywords = { underline = true },
    --                 functions = { bold = true, undercurl = true },
    --                 variables = {},
    --                 operators = {},
    --                 types = {},
    --             },
    --             plugins = {
    --                 -- "coc",
    --                 -- "colorful-winsep",
    --                 "dap",
    --                 "dashboard",
    --                 -- "eyeliner",
    --                 -- "fidget",
    --                 -- "flash",
    --                 -- "gitsigns",
    --                 -- "harpoon",
    --                 -- "hop",
    --                 -- "illuminate",
    --                 "indent-blankline",
    --                 -- "lspsaga",
    --                 -- "mini",
    --                 -- "neogit",
    --                 -- "neotest",
    --                 -- "neo-tree",
    --                 -- "neorg",
    --                 -- "noice",
    --                 "nvim-cmp",
    --                 -- "nvim-navic",
    --                 "nvim-tree",
    --                 "nvim-web-devicons",
    --                 -- "rainbow-delimiters",
    --                 -- "sneak",
    --                 "telescope",
    --                 "trouble",
    --                 "which-key",
    --                 --"nvim-notify",
    --             },
    --             disable = {
    --                 colored_cursor = false,
    --                 borders = false,
    --                 background = true,
    --                 term_colors = false,
    --                 eob_lines = false,
    --             },
    --             high_visibility = {
    --                 lighter = false,
    --                 darker = true,
    --             },
    --             lualine_style = "stealth",
    --             async_loading = true,
    --             colors = require("material.colors"),
    --             custom_colors = function(colors)
    --                 colors.syntax.string = "#33ff7b"
    --             end,
    --             custom_highlights = {
    --                 DashboardHeader = { fg = "#c4a7e7" },
    --                 DashboardDesc = { fg = "#31748f" },
    --                 DashboardKey = { fg = "#abebc6" },
    --                 DashboardIcon = { fg = "#31748f" },
    --                 DashboardShortcut = { fg = "#ffc300" },
    --             },
    --         })
    --
    --         -- Apply the colorscheme
    --         vim.cmd("colorscheme material")
    --     end,
    -- },
}

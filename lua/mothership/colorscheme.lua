local material = require 'material'


material.setup({
    contrast = {
        terminal = false, -- Enable contrast for the built-in terminal
        sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = false, -- Enable contrast for floating windows
        cursor_line = false, -- Enable darker background for the cursor line
        non_current_windows = false, -- Enable contrasted background for non-current windows
        filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
    },
    styles = { -- Give comments style such as bold, italic, underline etc.
        comments = {italic = true},
        keywords = {underline = true},
        functions = {bold = true, undercurl = true},
        variables = {},
        operators = {},
        types = {},
    },
    plugins = { -- Uncomment the plugins that you use to highlight them
    -- Available plugins:
    "dap",
    "dashboard",
    -- "gitsigns",
    -- "hop",
    "indent-blankline",
    -- "lspsaga",
    -- "mini",
    -- "neogit",
    -- "neorg",
    "nvim-cmp",
    -- "nvim-navic",
    "nvim-tree",
    "nvim-web-devicons",
    -- "sneak",
    "telescope",
    -- "trouble",
    "which-key",
    },
    disable = {
        colored_cursor = false, -- Disable the colored cursor
        borders = false, -- Disable borders between verticaly split windows
        background = true, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
        term_colors = false, -- Prevent the theme from setting terminal colors
        eob_lines = false -- Hide the end-of-buffer lines
    },
    high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = true -- Enable higher contrast text for darker style
    },
    lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )
    async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
    colors = require 'material.colors',
    custom_colors = function(colors)
        colors.syntax.string = "#ffbefe"
    end,
    custom_highlights = {
        DashboardHeader = { fg = "#c4b9ff" },
        DashboardDesc = { fg = "#abebc6" },
        DashboardKey = { fg = "#abebc6" },
        DashboardIcon = { fg = "#abebc6" },
        DashboardShotCut = { fg = "#abebc6" },
        DashboardShortcut = { fg = "#ffc300" },
    } -- Overwrite highlights with your own
})
vim.g.material_style = "deep ocean"
-- setup must be called before loading
vim.cmd 'colorscheme material'

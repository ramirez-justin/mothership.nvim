return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                variant = "main", -- Using main variant for a richer color palette
                dark_variant = "main",
                dim_inactive_windows = true, -- Dim inactive windows for better focus
                extend_background_behind_borders = true,

                enable = {
                    terminal = true,
                    legacy_highlights = true,
                    migrations = true,
                },

                styles = {
                    bold = true,
                    italic = false,
                    transparency = false, -- Set to true if you want transparency
                },

                groups = {
                    border = "muted",
                    link = "iris",
                    panel = "surface",

                    error = "love",
                    hint = "iris",
                    info = "rose",
                    note = "pine",
                    todo = "foam",
                    warn = "gold",

                    git_add = "rose",
                    git_change = "rose",
                    git_delete = "love",
                    git_dirty = "rose",
                    git_ignore = "muted",
                    git_merge = "iris",
                    git_rename = "pine",
                    git_stage = "iris",
                    git_text = "rose",
                    git_untracked = "subtle",

                    h1 = "iris",
                    h2 = "foam",
                    h3 = "rose",
                    h4 = "gold",
                    h5 = "pine",
                    h6 = "foam",
                },

                highlight_groups = {
                    Normal = { fg = "text" },
                    -- Make comments more visible with a distinct color
                    Comment = { fg = "muted", italic = true },

                    -- Enhance cursor line visibility
                    CursorLine = { bg = "overlay", blend = 10 },

                    -- Make visual selection more prominent
                    Visual = { bg = "gold", fg = "base", blend = 18 },

                    -- Enhance line numbers
                    LineNr = { fg = "rose", bold = false },
                    CursorLineNr = { fg = "gold", bold = true },

                    -- Make search highlights more visible
                    Search = { bg = "gold", fg = "base", bold = true },
                    IncSearch = { bg = "love", fg = "base", bold = true },

                    -- Enhance matching parentheses
                    MatchParen = { fg = "love", bold = true, underline = true },

                    -- Make diagnostics more visible
                    DiagnosticError = { fg = "love", bold = true },
                    DiagnosticWarn = { fg = "gold", bold = true },
                    DiagnosticInfo = { fg = "foam", bold = true },
                    DiagnosticHint = { fg = "iris", bold = true },

                    -- Enhance diff colors
                    DiffAdd = { bg = "pine", blend = 20 },
                    DiffChange = { bg = "gold", blend = 20 },
                    DiffDelete = { bg = "love", blend = 20 },

                    -- Make status line more prominent
                    StatusLine = { bg = "surface", fg = "text", bold = true },

                    -- Enhance fold text
                    Folded = { fg = "iris", bg = "overlay", italic = true },

                    -- Enhance keywords to make them stand out
                    Keyword = { fg = "gold", bold = true },
                    Statement = { fg = "love", bold = true },
                    Conditional = { fg = "love", bold = true },
                    Repeat = { fg = "love", bold = true },
                    Label = { fg = "love", bold = true },
                    Exception = { fg = "gold", bold = true },

                    -- Enhance operators and special characters
                    Operator = { fg = "rose", bold = false },
                    Special = { fg = "rose" },

                    -- Enhance function calls and definitions
                    Function = { fg = "rose", bold = true },
                    Method = { fg = "iris", bold = true },

                    -- Enhance types and structures
                    Type = { fg = "rose", bold = true },
                    Structure = { fg = "rose", bold = true },
                    StorageClass = { fg = "rose", bold = true },

                    -- Enhance constants and identifiers
                    Constant = { fg = "gold" },
                    String = { fg = "pine", italic = true },
                    Character = { fg = "pine" },
                    Number = { fg = "gold", bold = true },
                    Boolean = { fg = "gold", bold = true },
                    Float = { fg = "gold", bold = true },

                    -- Enhance identifiers
                    Identifier = { fg = "rose" },

                    -- Enhance mode indicators with better colors and contrast
                    ModesInsert = { fg = "base", bg = "foam", bold = true }, -- Teal/cyan for Insert mode
                    ModesNormal = { fg = "base", bg = "iris", bold = true }, -- Purple for Normal mode
                    ModesVisual = { fg = "base", bg = "gold", bold = true }, -- Gold for Visual mode
                    ModesReplace = { fg = "base", bg = "love", bold = true }, -- Red/pink for Replace mode
                    ModesCopy = { fg = "base", bg = "pine", bold = true }, -- Green for Copy mode
                    ModesDelete = { fg = "base", bg = "love", bold = true }, -- Red/pink for Delete mode
                    ModesCommand = { fg = "base", bg = "gold", bold = true }, -- Gold for Command mode

                    -- Fix popup menu selection for better readability
                    Pmenu = { fg = "text", bg = "overlay" }, -- Popup menu normal item
                    PmenuSel = { fg = "base", bg = "iris", bold = true }, -- Selected item in the popup menu
                    PmenuSbar = { bg = "overlay" },        -- Popup menu scrollbar
                    PmenuThumb = { bg = "subtle" },        -- Popup menu scrollbar thumb
                },
            })

            vim.cmd("colorscheme rose-pine")
        end,
    },
}

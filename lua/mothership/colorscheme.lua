require("catppuccin").setup({
    name = "catppuccin",
    flavour = "mocha",
    term_colors = true,
    transparent_background = true,
    styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
    },
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        which_key = false,
        treesitter = true,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },

})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

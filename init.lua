-- My config using lazyvim
-- Author: Justin Ramirez
-- Lots of inspiration from:
-- <https://github.com/jmbuhr/quarto-nvim-kickstarter>

-- Lazyloader
require("lazy").setup({
    -- default lazy keybinds

    -- Noice
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        -- or                              , branch = '0.1.x',
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    "smartpde/telescope-recent-files", -- Telescope plugin for recent files

    -- Material theme
    "marko-cerovac/material.nvim",

    -- mini.nvim
    { "echasnovski/mini.nvim", version = false },

    -- Treesitter plugin
    "nvim-treesitter/nvim-treesitter",

    --Playground plugin
    "nvim-treesitter/playground",

    -- Popup plugin
    "nvim-lua/popup.nvim",

    -- Plenary
    "nvim-lua/plenary.nvim",

    -- Nvim-web-devicons
    "nvim-tree/nvim-web-devicons",

    -- Undotree plugin and config
    {
        "jiaoshijie/undotree",
        config = function()
            require("undotree").setup()
        end,
        requires = {
            "nvim-lua/plenary.nvim",
        },
    },

    -- Nvim-tree plugin
    "nvim-tree/nvim-tree.lua",

    -- Lualine plugin
    "nvim-lualine/lualine.nvim",

    -- Indent Blankline plugin
    -- { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    -- LSP Plugins
    --Quickstart configurations for the LSP client

    -- none-ls
    "nvimtools/none-ls.nvim",
    -- nvim-dap plugin
    "mfussenegger/nvim-dap",
    { "rcarriga/nvim-dap-ui",  requires = { "mfussenegger/nvim-dap" } },
    { "nvim-neotest/nvim-nio" },

    -- Completion Plugins
    "hrsh7th/nvim-cmp",          -- Autocompletion plugin
    "hrsh7th/cmp-nvim-lsp",      -- LSP source for nvim-cmp
    "saadparwaiz1/cmp_luasnip",  -- Snippets source for nvim-cmp
    "L3MON4D3/LuaSnip",          -- Snippets plugin
    "rafamadriz/friendly-snippets", --Snippets source for nvim cmp
    "hrsh7th/cmp-buffer",        -- Buffer source for nvim-cmp
    "hrsh7th/cmp-path",          -- Path source for nvim-cmp
    "hrsh7th/cmp-calc",          -- Calculator source for nvim-cmp
    "hrsh7th/cmp-emoji",         -- Emoji source for nvim-cmp
    "hrsh7th/cmp-cmdline",       -- Cmdline source for nvim-cmp

    -- Lazygit
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    -- Dashboard
    {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
    },

    -- Github Copilot
    { "zbirenbaum/copilot.lua" },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end,
    },

    -- Toggler term
    { "akinsho/toggleterm.nvim", version = "*", config = true },

    -- Bufferline
    { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },

    -- Notify
    { "rcarriga/nvim-notify" },

    -- NUI
    { "MunifTanjim/nui.nvim" },

    -- Comment
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}, -- this is equalent to setup({}) function
    },

    -- Peek: preview markdown files
    {
        "toppair/peek.nvim",
        event = { "VeryLazy" },
        build = "deno task --quiet build:fast",
        config = function()
            require("peek").setup()
            -- refer to `configuration to change defaults`
            vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
        end,
    },

    -- Compiler buffer
    { --Compiler
        "Zeioth/compiler.nvim",
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        dependencies = { "stevearc/overseer.nvim" },
        opts = {},
    },
    { -- Task Runner
        "stevearc/overseer.nvim",
        commit = "68a2d344cea4a2e11acfb5690dc8ecd1a1ec0ce0",
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        opts = {
            task_list = {
                direction = "bottom",
                min_height = 25,
                max_height = 25,
                default_detail = 1,
            },
        },
    },

    -- Definition-or-references.nvim: JetBrains like definition and references handling
    { "KostkaBrukowa/definition-or-references.nvim" },

    -- TODO: actually implement this or replace with something else
    -- Database Management
    { "tpope/vim-dadbod",                           cmd = { "DB", "DBUI", "DBUIToggle" } },
    { "kristijanhusak/vim-dadbod-ui",               cmd = { "DBUI", "DBUIToggle" } },
    { "kristijanhusak/vim-dadbod-completion" },
    -- maybe this: https://github.com/Xemptuous/sqlua.nvim

    --pre-commit.nvim
    { "ttibsi/pre-commit.nvim" },

    -- TODO: Add the following plugins
    -- investigate replacing many of these with snacks.nvim
    -- https://github.com/folke/snacks.nvim

    -- Maybe use octo.nvim instead of gh dash
    -- https://github.com/pwntester/octo.nvim
})

-- The mothership
require("mothership")

-- new setup
-- configuration files
require("config.env_switcher") -- Set python environment based on file path
require("config.lazy")
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- plugin files
require("plugins.telescope")

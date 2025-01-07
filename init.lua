-- My config using lazyvim
-- Author: Justin Ramirez
-- Lots of inspiration from:
-- <https://github.com/jmbuhr/quarto-nvim-kickstarter>

-- Lazyloader
require("lazy").setup({
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

    -- Lazygit

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
})

-- new setup
-- configuration files
require("config.env_switcher") -- Set python environment based on file path
require("config.lazy")
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- plugin files
require("plugins.telescope")

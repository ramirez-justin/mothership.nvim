-- My config using lazyvim
-- Author: Justin Ramirez

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Lazyloader
require("lazy").setup({
    -- default lazy keybinds
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
        end,
        opts = {}
    },
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    -- Trouble
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },

    -- Telescope
    { 'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    "smartpde/telescope-recent-files",   -- Telescope plugin for recent files

    -- Material theme
    "marko-cerovac/material.nvim",

    -- Treesitter plugin
    "nvim-treesitter/nvim-treesitter",

    --Playground plugin
    "nvim-treesitter/playground",

    -- Harpoon plugin
    "theprimeagen/harpoon",

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
            require('undotree').setup()
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
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate" -- :MasonUpdate updates registry contents
    },
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig", --Quickstart configurations for the LSP client

    -- none-ls
    "nvimtools/none-ls.nvim",
    -- nvim-dap plugin
    "mfussenegger/nvim-dap",
    { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} },

    -- Completion Plugins
    "hrsh7th/nvim-cmp", -- Autocompletion plugin
    "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
    "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
    "L3MON4D3/LuaSnip", -- Snippets plugin
    "rafamadriz/friendly-snippets", --Snippets source for nvim cmp
    "hrsh7th/cmp-buffer", -- Buffer source for nvim-cmp
    "hrsh7th/cmp-path", -- Path source for nvim-cmp
    "hrsh7th/cmp-calc", -- Calculator source for nvim-cmp
    "hrsh7th/cmp-emoji", -- Emoji source for nvim-cmp
    "hrsh7th/cmp-cmdline", -- Cmdline source for nvim-cmp

    -- Lazygit
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    -- Dashboard
    { "glepnir/dashboard-nvim",
        event = 'VimEnter',
        dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },

    -- Github Copilot
    { "zbirenbaum/copilot.lua" },
    { "zbirenbaum/copilot-cmp",
        config = function ()
            require("copilot_cmp").setup()
        end
    },

    -- Toggler term
    {'akinsho/toggleterm.nvim', version = "*", config = true},

    -- Bufferline
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

    -- Notify
    {'rcarriga/nvim-notify'},

    -- Wilder
    {'gelguy/wilder.nvim'},

    -- DBTpal
    {'PedramNavid/dbtpal'},

    -- Comment
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

    -- Autopairs
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
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

    -- TODO: setup buffer for sptify-tui
    -- requires spotify-tui: https://github.com/Rigellute/spotify-tui
    -- requires spotifyd: https://github.com/Spotifyd/spotifyd

    -- TODO: actually implement this or replace with something else
    -- Database Management
    { "tpope/vim-dadbod", cmd = { "DB", "DBUI", "DBUIToggle" } },
    { "kristijanhusak/vim-dadbod-ui", cmd = { "DBUI", "DBUIToggle" } },
    { "kristijanhusak/vim-dadbod-completion" },
    -- maybe this: https://github.com/Xemptuous/sqlua.nvim


    -- TODO: Add the following plugins
    -- add chatGPT
    -- https://github.com/jackMort/ChatGPT.nvim

    -- add compiler buffer
    -- https://github.com/Zeioth/compiler.nvim

    -- add git dashboard
    -- https://github.com/dlvhdr/gh-dash

})

-- The mothership
require('mothership')

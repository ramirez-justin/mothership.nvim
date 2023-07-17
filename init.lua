-- My config using lazyvim

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
  {"folke/which-key.nvim", event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
  -- Telescope.nvim
  {'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  -- Recent files extenssion
  {"smartpde/telescope-recent-files"},
  -- Catppuccin theme
  { "catppuccin/nvim", name = "catppuccin", 
    priority = 1000
  },
  -- Treesitter plugin
  "nvim-treesitter/nvim-treesitter",
  --Playground plugin
  "nvim-treesitter/playground",
  -- Harpoon plugin
  "theprimeagen/harpoon",
  -- Plenary
  "nvim-lua/plenary.nvim",
  -- Nvim-web-devicons
  "nvim-tree/nvim-web-devicons",
  -- Undotree plugin and config
  "jiaoshijie/undotree",	
  -- Nvim-tree plugin
  "nvim-tree/nvim-tree.lua", 	
  -- Lualine plugin
  "nvim-lualine/lualine.nvim",
  -- Indent Blankline plugin
  "lukas-reineke/indent-blankline.nvim",
  -- LSP Plugins
  {"williamboman/mason.nvim",
    build = ":MasonUpdate" -- :MasonUpdate updates registry contents
  },
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  -- nvim-dap plugin
  "mfussenegger/nvim-dap",
  -- nvim-cmp
  "hrsh7th/nvim-cmp", -- Autocompletion plugin
  "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
  "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
  "L3MON4D3/LuaSnip", -- Snippets plugin
  {"kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  -- Dashboard
  {"glepnir/dashboard-nvim",
    event = 'VimEnter',
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
  -- Copilot.lua
  { "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },
  -- COC.nvim
  {'neoclide/coc.nvim', branch = 'release'},
  -- Toggler term
  {'akinsho/toggleterm.nvim', version = "*", config = true},
  -- Bufferline
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
  -- Notify
  {'rcarriga/nvim-notify'},
  {'gelguy/wilder.nvim'},
})

require('mothership')


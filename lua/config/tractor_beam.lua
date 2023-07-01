------- Plugin Manager --------


-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'


	-- Telescope.nvim
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Catppuccin theme
	use { 
		"catppuccin/nvim", 
		as = "catppuccin" 
	}

	-- Treesitter plugin
	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	--Playground plugin
	use ('nvim-treesitter/playground')

	-- Harpoon plugin
	use ('theprimeagen/harpoon')

	-- Undotree plugin and config
	use {
		"jiaoshijie/undotree",
		config = function()
			require('undotree').setup()
		end,
		requires = {
			"nvim-lua/plenary.nvim",
		},
	}

	--Fugitive plugin
	use 'tpope/vim-fugitive'

	-- Nvim-tree plugin
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		},
	}

	-- Lualine plugin
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	-- Indent Blankline plugin
	use ("lukas-reineke/indent-blankline.nvim")

	-- LSP Plugins
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
		run = ":MasonUpdate" -- :MasonUpdate updates registry contents
	}

	-- nvim-dap plugin
	use 'mfussenegger/nvim-dap'

	-- nvim-cmp
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin
end)

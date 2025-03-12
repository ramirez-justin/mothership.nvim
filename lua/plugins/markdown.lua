return {
	-- <https://github.com/toppair/peek.nvim>
	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup()
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},
	-- <https://github.com/MeanderingProgrammer/render-markdown.nvim>
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		-- { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			latex = { enabled = false },
			file_types = { "markdown", "Avante" },
		},
		ft = { "markdown", "Avante" },
	},
	{
		"nvim-neorg/neorg",
		lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
		version = "*", -- Pin Neorg to the latest stable release
		config = true,
	},
}

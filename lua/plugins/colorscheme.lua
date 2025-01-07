return {
	-- <https://github.com/marko-cerovac/material.nvim>
	"marko-cerovac/material.nvim",
	lazy = false, -- Load immediately
	priority = 1000, -- Ensure it loads first
	config = function()
		-- Set the material style
		vim.g.material_style = "deep ocean" -- Change to your preferred style

		-- Load the theme with your configuration
		require("material").setup({
			contrast = {
				terminal = false,
				sidebars = false,
				floating_windows = false,
				cursor_line = false,
				non_current_windows = false,
				filetypes = {},
			},
			styles = {
				comments = { italic = true },
				keywords = { underline = true },
				functions = { bold = true, undercurl = true },
				variables = {},
				operators = {},
				types = {},
			},
			plugins = {
				-- "coc",
				-- "colorful-winsep",
				-- "dap",
				-- "dashboard",
				-- "eyeliner",
				-- "fidget",
				-- "flash",
				-- "gitsigns",
				-- "harpoon",
				-- "hop",
				-- "illuminate",
				-- "indent-blankline",
				-- "lspsaga",
				-- "mini",
				-- "neogit",
				-- "neotest",
				-- "neo-tree",
				-- "neorg",
				-- "noice",
				-- "nvim-cmp",
				-- "nvim-navic",
				-- "nvim-tree",
				-- "nvim-web-devicons",
				-- "rainbow-delimiters",
				-- "sneak",
				-- "telescope",
				-- "trouble",
				-- "which-key",
				-- "nvim-notify",
			},
			disable = {
				colored_cursor = false,
				borders = false,
				background = true,
				term_colors = false,
				eob_lines = false,
			},
			high_visibility = {
				lighter = false,
				darker = true,
			},
			lualine_style = "stealth",
			async_loading = true,
			colors = require("material.colors"),
			custom_colors = function(colors)
				colors.syntax.string = "#33ff7b"
			end,
			custom_highlights = {
				DashboardHeader = { fg = "#c4a7e7" },
				DashboardDesc = { fg = "#ebbcba" },
				DashboardKey = { fg = "#9ccfd8" },
				DashboardIcon = { fg = "#ebbcba" },
				DashboardShotCut = { fg = "#9ccfd8" },
				DashboardShortcut = { fg = "#ffc300" },
			},
		})

		-- Apply the colorscheme
		vim.cmd("colorscheme material")
	end,
}

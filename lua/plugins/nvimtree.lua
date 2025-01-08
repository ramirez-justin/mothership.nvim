return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			view = {
				width = 50,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = false,
				git_ignored = false,
			},
		})
	end,
}

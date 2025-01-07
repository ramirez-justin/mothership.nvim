return {
	-- <https://github.com/kdheepak/lazygit.nvim>
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"f-person/git-blame.nvim",
		init = function()
			require("gitblame").setup({
				enabled = false,
			})
			vim.g.gitblame_display_virtual_text = 1
			-- vim.g.gitblame_enabled = 0
		end,
	},
	-- <https://github.com/zbirenbaum/copilot.lua>
	{
		"zbirenbaum/copilot.lua",
		opts = {
			suggestion = {
				enabled = true, -- Enable inline suggestions
				auto_trigger = true, -- Auto-trigger suggestions
				debounce = 75, -- Debounce for responsiveness
				keymap = {
					accept = "<C-J>", -- Accept suggestion
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-K>", -- Dismiss suggestion
				},
			},
			panel = {
				enabled = true, -- Enable Copilot panel
				keymap = {
					jump_next = "<C-n>",
					jump_prev = "<C-p>",
					accept = "<CR>",
					refresh = "gr",
				},
			},
			filetypes = {
				["*"] = true, -- Enable Copilot for all filetypes
				markdown = true,
				help = true,
			},
		},
		config = function(_, opts)
			require("copilot").setup(opts)
		end,
	},
	-- Integration with nvim-cmp
	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "zbirenbaum/copilot.lua" },
		opts = {},
		config = function(_, opts)
			require("copilot_cmp").setup(opts)
		end,
	},
	--pre-commit.nvim
	{ "ttibsi/pre-commit.nvim" },
}

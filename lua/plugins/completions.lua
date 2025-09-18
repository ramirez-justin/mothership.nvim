-- https://github.com/hrsh7th/nvim-cmp
return {
	"hrsh7th/nvim-cmp",

	dependencies = {
		-- LSP completion
		"hrsh7th/cmp-nvim-lsp",

		-- Other completion sources
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-calc", -- Calculator source for nvim-cmp
		"hrsh7th/cmp-emoji", -- Emoji source for nvim-cmp

		-- Snippets
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets", -- Snippets source for nvim cmp
		"saadparwaiz1/cmp_luasnip",

		-- AI completion
		-- "zbirenbaum/copilot.lua",
		-- "zbirenbaum/copilot-cmp",
		"Exafunction/windsurf.nvim",

		-- Autopairs integration
		"windwp/nvim-autopairs",

		-- Database completion
		"tpope/vim-dadbod",
		"kristijanhusak/vim-dadbod-completion",
		"kristijanhusak/vim-dadbod-ui",

		-- Markdown rendering
		"MeanderingProgrammer/render-markdown.nvim",
	},

	config = function()
		-- Set up nvim-cmp
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local autopairs = require("nvim-autopairs")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		-- Icons for completion items
		local kind_icons = {
			Text = "󰊄",
			Method = "m",
			Function = "󰊕",
			Constructor = "",
			Field = "",
			Variable = "󰫧",
			Class = "",
			Interface = "",
			Module = "",
			Property = "",
			Unit = "",
			Value = "",
			Enum = "",
			Keyword = "󰌆",
			Snippet = "",
			Color = "",
			File = "",
			Reference = "",
			Folder = "",
			EnumMember = "",
			Constant = "",
			Struct = "",
			Event = "",
			Operator = "",
			TypeParameter = "󰉺",
			-- Copilot = "",
			Codeium = "",
		}
		-- find more here: https://www.nerdfonts.com/cheat-sheet

		-- vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
		vim.api.nvim_set_hl(0, "CmpItemKindCodeium", { fg = "#09B6A2" })

		-- Setup main completion
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					-- Add icons
					vim_item.kind = kind_icons[vim_item.kind]

					-- Add source-specific labels
					vim_item.menu = ({
						-- copilot = "[Copilot]",
						codeium = "[Codeium]",
						nvim_lsp = "[LSP]",
						luasnip = "[Snippet]",
						calc = "[Calc]",
						buffer = "[Buffer]",
						path = "[Path]",
						emoji = "[Emoji]",
						cmdline = "[CMD]",
						["vim-dadbod-completion"] = "[DB]",
						["render-markdown"] = "[Markdown]",
					})[entry.source.name]

					return vim_item
				end,
			},
			sources = {
				-- { name = "copilot" },
				{ name = "codeium" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "render-markdown" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "calc" },
				{ name = "emoji" },
			},
		})

		-- Command-line completion for search
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Command-line completion for commands
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources(
				{ { name = "path" } },
				{ { name = "cmdline" } },
				{ { name = "render-markdown" } }
			),
		})

		-- Setup autopairs integration
		autopairs.setup({
			check_ts = true,
			ts_config = {
				lua = { "string" },
				javascript = { "template_string" },
				java = false,
			},
		})
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		-- Setup Copilot
		-- require("copilot").setup({
		-- 	suggestion = { enabled = false },
		-- 	panel = { enabled = false },
		-- })
		-- require("copilot_cmp").setup()

		-- Setup Codeium
		require("codeium").setup({})
	end,
}

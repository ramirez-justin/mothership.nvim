-- https://github.com/hrsh7th/nvim-cmp
return {
	-- Completion sources - defined separately for better lazy loading
	{ "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
	{ "hrsh7th/cmp-buffer", event = "InsertEnter" },
	{ "hrsh7th/cmp-path", event = "InsertEnter" },
	{ "hrsh7th/cmp-cmdline", event = "CmdlineEnter" },
	{ "hrsh7th/cmp-calc", event = "InsertEnter" },
	{ "hrsh7th/cmp-emoji", event = "InsertEnter" },

	-- Snippets
	{ "L3MON4D3/LuaSnip", event = "InsertEnter" },
	{ "rafamadriz/friendly-snippets", event = "InsertEnter" },
	{ "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },

	-- AI completion
	{ "Exafunction/windsurf.nvim", event = "InsertEnter" },

	-- Autopairs integration
	{ "windwp/nvim-autopairs", event = "InsertEnter" },

	-- Database completion
	{ "tpope/vim-dadbod" },
	{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } },
	{ "kristijanhusak/vim-dadbod-ui", cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection" } },

	-- Markdown rendering
	{ "MeanderingProgrammer/render-markdown.nvim", ft = "markdown" },

	-- Main completion plugin
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-emoji",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
			"Exafunction/windsurf.nvim",
			"windwp/nvim-autopairs",
			"kristijanhusak/vim-dadbod-completion",
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
				Constructor = "",
				Field = "",
				Variable = "󰫧",
				Class = "",
				Interface = "",
				Module = "",
				Property = "",
				Unit = "",
				Value = "",
				Enum = "",
				Keyword = "󰌆",
				Snippet = "",
				Color = "",
				File = "",
				Reference = "",
				Folder = "",
				EnumMember = "",
				Constant = "",
				Struct = "",
				Event = "",
				Operator = "",
				TypeParameter = "󰉺",
				Codeium = "",
			}
			-- find more here: https://www.nerdfonts.com/cheat-sheet

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

			-- Setup Codeium
			require("codeium").setup({})
		end,
	},
}

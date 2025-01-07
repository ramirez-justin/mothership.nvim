return {
	-- <https://github.com/folke/neoconf.nvim>
	{ -- a Neovim plugin to manage global and project-local settings.
		"folke/neoconf.nvim",
		opts = {},
		cmd = { "NeoConf" },
	},
	-- Tip: You can force enable/disable lazydev in certain project folders using :h
	-- 'exrc' with vim.g.lazydev_enabled = true or vim.g.lazydev_enabled = false-
	-- <https://github.com/folke/lazydev.nvim>
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	-- <https://github.com/hrsh7th/nvim-cmp>
	{ -- optional cmp completion source for require statements and module annotations
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0, -- set group index to 0 to skip loading LuaLS completions
			})
		end,
	},
	-- { -- optional blink completion source for require statements and module annotations
	--     "saghen/blink.cmp",
	--     opts = {
	--         sources = {
	--             -- add lazydev to your completion providers
	--             default = { "lazydev", "lsp", "path", "snippets", "buffer" },
	--             providers = {
	--                 lazydev = {
	--                     name = "LazyDev",
	--                     module = "lazydev.integrations.blink",
	--                     -- make lazydev completions top priority (see `:h blink.cmp`)
	--                     score_offset = 100,
	--                 },
	--             },
	--         },
	--     },
	-- },
	-- common dependencies
	{ "nvim-lua/plenary.nvim" },
}

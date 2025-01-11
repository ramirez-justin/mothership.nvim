return {
	-- <https://github.com/nvim-lualine/lualine.nvim>
	{ -- A blazing fast and easy to configure Neovim statusline written in Lua.
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function(_, opts)
			opts.options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = { "NvimTree" },
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 300,
					tabline = 300,
					winbar = 300,
				},
			}
			opts.sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			}
			opts.inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			}
		end,
	},

	{ -- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	-- <https://github.com/dstein64/nvim-scrollview>
	{ -- a Neovim plugin that displays interactive vertical scrollbars and signs.
		"dstein64/nvim-scrollview",
		enabled = true,
		opts = {
			current_only = true,
		},
	},

	-- <https://github.com/folke/which-key.nvim>
	{ --  helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type.
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
		config = function()
			require("which-key").setup({})
			require("config.keymaps")
		end,
	},

	-- <https://github.com/KostkaBrukowa/definition-or-references.nvim>
	{ -- Definition-or-references.nvim: JetBrains like definition and references handling
		"KostkaBrukowa/definition-or-references.nvim",
		opts = {},
	},

	-- <https://github.com/akinsho/bufferline.nvim>
	{ -- A snazzy 💅 buffer line (with tabpage integration) for Neovim built using lua.
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = function(_, opts)
			-- Merge your custom configuration into `opts`
			opts.options = {
				close_command = "bdelete! %d",
				number = false,
				right_mouse_command = nil,
				left_mouse_command = "buffer %d",
				middle_mouse_command = nil,
				indicator = {
					icon = "▎", -- This should be omitted if indicator style is not 'icon'
					style = "icon",
				},
				buffer_close_icon = "",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				max_name_length = 18,
				max_prefix_length = 15,
				tab_size = 10,
				diagnostics = false,
				custom_filter = function(bufnr)
					-- Filter out specific filetypes
					local exclude_ft = { "qf", "fugitive", "git" }
					local cur_ft = vim.bo[bufnr].filetype
					return not vim.tbl_contains(exclude_ft, cur_ft)
				end,
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,
				persist_buffer_sort = false, -- Whether or not custom sorted buffers should persist
				separator_style = "slant",
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				sort_by = "id",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true, -- Use "true" to enable the default, or set your own character
					},
				},
			}
			opts.highlights = {
				fill = {
					bg = {
						attribute = "fg",
						highlight = "Pmenu",
					},
				},
			}
		end,
	},

	-- <https://github.com/numToStr/Comment.nvim>
	{ -- ⚡ Smart and Powerful commenting plugin for neovim ⚡
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup() -- Simple setup without defining keymaps here
		end,
		event = "BufReadPost", -- Optional lazy-load on buffer read
	},

	-- <https://github.com/nvim-telescope/telescope.nvim>
	{ -- Gaze deeply into unknown regions using the power of the moon.
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		-- or tag = '0.1.8',
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "smartpde/telescope-recent-files" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "nvim-telescope/telescope-dap.nvim" },
			{
				"jmbuhr/telescope-zotero.nvim",
				enabled = true,
				dev = false,
				dependencies = {
					{ "kkharji/sqlite.lua" },
				},
				config = function()
					vim.keymap.set("n", "<leader>fz", ":Telescope zotero<cr>", { desc = "[z]otero" })
				end,
			},
		},
		opts = function(_, opts)
			local actions = require("telescope.actions")
			local trouble = require("trouble.sources.telescope")

			opts.defaults = {
				mappings = {
					i = {
						-- Cycle through history
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
						-- Move up and down through the list
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						-- Send to quickfix list
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
						["<C-c>"] = actions.close,
						["<C-t>"] = trouble.open,
					},
					n = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
						["<C-c>"] = actions.close,
						["<C-t>"] = trouble.open,
					},
				},
			}
			opts.pickers = {
				-- Add picker-specific configurations here if needed
			}
			opts.extensions = {}
		end,
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			telescope.load_extension("fzf")
			telescope.load_extension("recent_files")
			telescope.load_extension("noice")
		end,
	},

	-- <https://github.com/folke/noice.nvim>
	{ -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = function(_, opts)
			opts.setup = {
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = false,
						["vim.lsp.util.stylize_markdown"] = false,
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = false, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			}
		end,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				config = function()
					require("notify").setup({
						background_colour = "#1e1e2e",
						stages = "fade_in_slide_out",
						timeout = 5000,
					})
				end,
			},
		},
	},

	-- Undotree plugin and config
	{
		"jiaoshijie/undotree",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("undotree").setup()
		end,
	},
}

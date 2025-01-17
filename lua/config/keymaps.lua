-- General Keymaps
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- NORMAL MODE --
-- Save
keymap("n", "<leader>w", "<cmd>w<cr>", opts)

-- Quit
keymap("n", "<leader>q", "<cmd>q<cr>", opts)

-- Close buffer
keymap("n", "<C-c>", "<cmd>bd<cr>", opts)

-- Toggle Highlight Search
keymap("n", "<leader>h", "<cmd>noh<cr>", opts)

-- Rapid Jump up and down
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)

-- Navigate Buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Navigate Windows
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resizing Panes
keymap("n", "<Left>", ":vertical resize +1<CR>", opts)
keymap("n", "<Right>", ":vertical resize -1<CR>", opts)
keymap("n", "<Up>", ":resize -1<CR>", opts)
keymap("n", "<Down>", ":resize +1<CR>", opts)

-- INSERT MODE --
-- Rapid escape
keymap("i", "jk", "<ESC>", opts)

local wk = require("which-key")

-- VISUAL MODE --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- Move selected line / block of text in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts) -- paste without yanking

wk.add({
	-- Dadbod UI
	{ "<leader>b", group = "Database" }, -- Group for all database-related actions
	{ "<leader>bu", "<cmd>DBUI<CR>", desc = "Open DBUI Interface" },
	{ "<leader>bt", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI Interface" },
	{ "<leader>ba", "<cmd>DBUIAddConnection<CR>", desc = "Add DB Connection" },
	{ "<leader>bf", "<cmd>DBUIFindBuffer<CR>", desc = "Find DB Buffer" },
	{ "<leader>br", "<cmd>DBUIRenameBuffer<CR>", desc = "Rename Buffer or Query" },
	{ "<leader>bi", "<cmd>DBUILastQueryInfo<CR>", desc = "Last Query Info" },
	{ "<leader>bn", "<cmd>DBUIHideNotifications<CR>", desc = "Hide Notifications" },
	-- Remap query-related actions
	{ "<Leader>bqs", "<Plug>(DBUI_ExecuteQuery)", desc = "Execute Query (Selection)" },
	{ "<Leader>bnn", "<Plug>(DBUI_ToggleResultLayout)", desc = "Toggle Result Layout" },
	{ "<Leader>bde", "<Plug>(DBUI_EditBindParameters)", desc = "Edit Bind Parameters" },

	-- Dashboard
	{ "<leader>d", "<cmd>Dashboard<cr>", desc = "Dashboard" },

	-- NvimTree group
	{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
	{
		"<C-t>",
		function()
			require("nvim-tree.api").tree.change_root_to_parent()
		end,
		desc = "Go to Parent Directory",
	},
	{
		"?",
		function()
			require("nvim-tree.api").tree.toggle_help()
		end,
		desc = "Toggle Help",
	},

	-- Telescope group
	{ "<leader>f", group = "Telescope" }, -- Group for file-related actions
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
	{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
	{ "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
	{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
	{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },

	-- Lazygit group
	{ "<leader>g", group = "Lazygit", icon = "" },
	{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open Lazygit" },

	-- Comment group
	{ "<gc>", group = "Linewise Comments" }, -- Group for linewise comment mappings
	{ "<gb>", group = "Blockwise Comments" }, -- Group for blockwise comment mappings
	{ "<gcL>", "<Plug>(comment_toggle_linewise)", desc = "Toggle Linewise Comment" },
	{ "<gcO>", "<Plug>(comment_insert_above)", desc = "Insert Linewise Comment Above" },
	{ "<gco>", "<Plug>(comment_insert_below)", desc = "Insert Linewise Comment Below" },
	{ "<gcA>", "<Plug>(comment_insert_eol)", desc = "Insert Comment at EOL" },
	{ "<gcc>", "<Plug>(comment_toggle_linewise_current)", desc = "Toggle Linewise Current Line" },
	{ "<gbl>", "<Plug>(comment_toggle_blockwise)", desc = "Toggle Blockwise Comment", remap = true },
	{ "<gbc>", "<Plug>(comment_toggle_blockwise_current)", desc = "Toggle Blockwise Current Block" },

	-- Precommit group
	{ "<leader>p", group = "Precommit" }, -- Group for pre-commit-related actions
	{ "<leader>pr", "<cmd>Precommit<cr>", desc = "Run Precommit" },

	-- Quit and Save
	{ "<leader>q", "<cmd>q<cr>", desc = "Quit" },
	{ "<leader>w", "<cmd>w<cr>", desc = "Write File" },

	-- Undotree
	{ "<leader>z", "<cmd>UndotreeToggle<cr>", desc = "UndoTree" },

	-- Nested example (NORMAL and VISUAL modes)
	{
		mode = { "n", "v" },
		{ "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- Inherited modes
		{ "<leader>w", "<cmd>w<cr>", desc = "Write" },
	},
})

-- -- TODO: Toggle GH Dash
-- -- local gh_dash = Terminal:new({
-- -- 	cmd = "gh dash",
-- -- 	direction = "float",
-- -- 	dir = "~/",
-- -- 	close_on_exit = true,
-- -- })
-- -- local function toggle_gh_dash()
-- -- 	gh_dash:toggle()
-- -- end
-- -- keymap("n", "<leader>gb", toggle_gh_dash, opts)
--
-- -- Light/Dark Theme Toggle
-- local function toggle_light_dark_theme()
--     -- May need to change this to toggle between sub-theme names
--     vim.o.background = vim.o.background == "light" and "dark" or "light"
-- end
-- keymap("n", "<leader>vt", toggle_light_dark_theme, { desc = "Toggle Light/Dark Theme" })

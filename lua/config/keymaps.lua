-- General Keymaps
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- NORMAL MODE --
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
	-- Dadbod UI (leader+b conflicts with Snacks.bufdelete)
	{ "<leader>D", group = "Database" }, -- Group for all database-related actions
	{ "<leader>Du", "<cmd>DBUI<CR>", desc = "Open DBUI Interface" },
	{ "<leader>Dt", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI Interface" },
	{ "<leader>Da", "<cmd>DBUIAddConnection<CR>", desc = "Add DB Connection" },
	{ "<leader>Df", "<cmd>DBUIFindBuffer<CR>", desc = "Find DB Buffer" },
	{ "<leader>Dr", "<cmd>DBUIRenameBuffer<CR>", desc = "Rename Buffer or Query" },
	{ "<leader>Di", "<cmd>DBUILastQueryInfo<CR>", desc = "Last Query Info" },
	{ "<leader>Dh", "<cmd>DBUIHideNotifications<CR>", desc = "Hide Notifications" },

	-- Remap query-related actions
	{ "<Leader>Dqs", "<Plug>(DBUI_ExecuteQuery)", desc = "Execute Query (Selection)" },
	{ "<Leader>Dnn", "<Plug>(DBUI_ToggleResultLayout)", desc = "Toggle Result Layout" },
	{ "<Leader>Dde", "<Plug>(DBUI_EditBindParameters)", desc = "Edit Bind Parameters" },

	-- Comment group
	{ "gc", group = "Linewise Comments" }, -- Group for linewise comment mappings
	{ "gb", group = "Blockwise Comments" }, -- Group for blockwise comment mappings
	{ "gcL", "<Plug>(comment_toggle_linewise)", desc = "Toggle Linewise Comment" },
	{ "gcO", "<Plug>(comment_insert_above)", desc = "Insert Linewise Comment Above" },
	{ "gco", "<Plug>(comment_insert_below)", desc = "Insert Linewise Comment Below" },
	{ "gcA", "<Plug>(comment_insert_eol)", desc = "Insert Comment at EOL" },
	{ "gcc", "<Plug>(comment_toggle_linewise_current)", desc = "Toggle Linewise Current Line" },
	{ "gbl", "<Plug>(comment_toggle_blockwise)", desc = "Toggle Blockwise Comment", remap = true },
	{ "gbc", "<Plug>(comment_toggle_blockwise_current)", desc = "Toggle Blockwise Current Block" },

	-- Precommit group
	{ "<leader>p", group = "Precommit" }, -- Group for pre-commit-related actions
	{ "<leader>pr", "<cmd>Precommit<cr>", desc = "Run Precommit" },

	-- Quit and Save
	{ "<leader>q", "<cmd>q<cr>", desc = "Quit" },
	{ "<leader>w", "<cmd>w<cr>", desc = "Write File" },

	-- Undotree (leader+z is used by Snacks.zen)
	{ "<leader>U", "<cmd>UndotreeToggle<cr>", desc = "UndoTree" },

	-- Avante.nvim
	{ "<leader>a", group = "Avante" }, -- Group for Avante.nvim actions
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

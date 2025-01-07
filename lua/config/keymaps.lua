-- General Keymaps
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- NORMAL MODE --
-- Save
keymap("n", "<leader>w", "<cmd>w<cr>", opts)

-- Quit
keymap("n", "<leader>q", "<cmd>q<cr>", opts)

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
	-- Telescope group
	{ "<leader>f", group = "Telescope" }, -- Group for file-related actions
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
	{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
	{ "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
	{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
	{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },

	-- NvimTree group
	{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },

	-- Lazygit group
	{ "<leader>g", group = "Lazygit", icon = "" },
	{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open Lazygit" },

	-- Dashboard
	{ "<leader>d", "<cmd>Dashboard<cr>", desc = "Dashboard" },

	-- Quit and Save
	{ "<leader>q", "<cmd>q<cr>", desc = "Quit" },
	{ "<leader>w", "<cmd>w<cr>", desc = "Write File" },

	-- Undotree
	{ "<leader>z", "<cmd>UndotreeToggle<cr>", desc = "UndoTree" },

	-- Proxy example for windows
	{ "<leader>w", proxy = "<c-w>", group = "Window Management" },

	-- Nested example (NORMAL and VISUAL modes)
	{
		mode = { "n", "v" },
		{ "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- Inherited modes
		{ "<leader>w", "<cmd>w<cr>", desc = "Write" },
	},

	-- Comment group
	{ "<gc>", group = "Linewise Comments" }, -- Group for linewise comment mappings
	{ "<gb>", group = "Blockwise Comments" }, -- Group for blockwise comment mappings
	{ "<gcL>", "<Plug>(comment_toggle_linewise)", desc = "Toggle Linewise Comment" },
	{ "<gcO>", "<Plug>(comment_insert_above)", desc = "Insert Linewise Comment Above" },
	{ "<gco>", "<Plug>(comment_insert_below)", desc = "Insert Linewise Comment Below" },
	{ "<gcA>", "<Plug>(comment_insert_eol)", desc = "Insert Comment at EOL" },
	{ "<gcc>", "<Plug>(comment_toggle_linewise_current)", desc = "Toggle Linewise Current Line" },
	{ "<gbl>", "<Plug>(comment_toggle_blockwise)", desc = "Toggle Blockwise Comment" },
	{ "<gbc>", "<Plug>(comment_toggle_blockwise_current)", desc = "Toggle Blockwise Current Block" },
})

-- -- Telescope Mappings
-- keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" }, { group = "Telescope" })
-- keymap("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Git Files" }, { group = "Telescope" })
-- keymap(
--     "n",
--     "<leader>fr",
--     "<cmd>Telescope oldfiles<cr>",
--     { desc = "Open Recent File", remap = true },
--     { group = "Telescope" }
-- )
-- keymap("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" }, { group = "Telescope" })
--
-- -- NvimTreeOpen
-- keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NVIM Tree" })
--

--

--
-- -- Terminal Mode Mappings
-- function _G.set_terminal_keymaps()
--     local term_opts = { buffer = 0 }
--     keymap("t", "<esc>", [[<C-\><C-n>]], term_opts)
--     keymap("t", "jk", [[<C-\><C-n>]], term_opts)
--     keymap("t", "<C-h>", [[<Cmd>wincmd h<CR>]], term_opts)
--     keymap("t", "<C-j>", [[<Cmd>wincmd j<CR>]], term_opts)
--     keymap("t", "<C-k>", [[<Cmd>wincmd k<CR>]], term_opts)
--     keymap("t", "<C-l>", [[<Cmd>wincmd l<CR>]], term_opts)
--     keymap("t", "<C-w>", [[<C-\><C-n><C-w>]], term_opts)
-- end
--
-- vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
--
-- -- Dashboard and Bufferline
-- keymap("n", "<leader>d", vim.cmd.Dashboard, opts)
-- keymap("n", "<leader>bp", vim.cmd.BufferLinePick, opts)
--
-- -- Undotree
-- keymap("n", "<leader>z", require("undotree").toggle, opts)
--
-- -- definition or references
-- keymap("n", "gd", require("definition-or-references").definition_or_references, opts)
--
-- -- Noice Dismiss
-- keymap("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", opts)
--
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

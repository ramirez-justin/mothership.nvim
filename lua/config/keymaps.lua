-- General Keymaps
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- NORMAL MODE --
-- Rapid Jump up and down
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
-- navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- navigate windows
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Resizing panes
keymap("n", "<Left>", ":vertical resize +1<CR>", opts)
keymap("n", "<Right>", ":vertical resize -1<CR>", opts)
keymap("n", "<Up>", ":resize -1<CR>", opts)
keymap("n", "<Down>", ":resize +1<CR>", opts)

-- Comment Mappings (<gc> and <gb>)
keymap("n", "<gcL>", "<Plug>(comment_toggle_linewise)", opts)
keymap("n", "<gcO>", "<Plug>(comment_insert_above)", opts)
keymap("n", "<gco>", "<Plug>(comment_insert_below)", opts)
keymap("n", "<gcA>", "<Plug>(comment_insert_eol)", opts)
keymap("n", "<gcc>", "<Plug>(comment_toggle_linewise_current)", opts)
keymap("n", "<gbl>", "<Plug>(comment_toggle_blockwise)", opts)
keymap("n", "<gbc>", "<Plug>(comment_toggle_blockwise_current)", opts)

-- INSERT MODE --
-- Rapid escape
keymap("i", "jk", "<ESC>", opts)

-- VISUAL MODE --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- Move selected line / block of text in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts) -- paste without yanking

-- Terminal Mode Mappings
function _G.set_terminal_keymaps()
	local term_opts = { buffer = 0 }
	keymap("t", "<esc>", [[<C-\><C-n>]], term_opts)
	keymap("t", "jk", [[<C-\><C-n>]], term_opts)
	keymap("t", "<C-h>", [[<Cmd>wincmd h<CR>]], term_opts)
	keymap("t", "<C-j>", [[<Cmd>wincmd j<CR>]], term_opts)
	keymap("t", "<C-k>", [[<Cmd>wincmd k<CR>]], term_opts)
	keymap("t", "<C-l>", [[<Cmd>wincmd l<CR>]], term_opts)
	keymap("t", "<C-w>", [[<C-\><C-n><C-w>]], term_opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Dashboard and Bufferline
keymap("n", "<leader>d", vim.cmd.Dashboard, opts)
keymap("n", "<leader>bp", vim.cmd.BufferLinePick, opts)

-- Undotree
keymap("n", "<leader>z", require("undotree").toggle, opts)

-- definition or references
keymap("n", "gd", require("definition-or-references").definition_or_references, opts)

-- Noice Dismiss
keymap("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", opts)

-- TODO: Toggle GH Dash
-- local gh_dash = Terminal:new({
-- 	cmd = "gh dash",
-- 	direction = "float",
-- 	dir = "~/",
-- 	close_on_exit = true,
-- })
-- local function toggle_gh_dash()
-- 	gh_dash:toggle()
-- end
-- keymap("n", "<leader>gb", toggle_gh_dash, opts)

-- Light/Dark Theme Toggle
local function toggle_light_dark_theme()
	-- May need to change this to toggle between sub-theme names
	vim.o.background = vim.o.background == "light" and "dark" or "light"
end
keymap("n", "<leader>vt", toggle_light_dark_theme, { desc = "Toggle Light/Dark Theme" })

-- Which-key mappings
local wk = require("which-key")
-- Register leader key mappings
wk.register({
	["<leader>"] = {
		d = { "<cmd>Dashboard<cr>", "Dashboard" }, -- Ensure 'Dashboard' command is available
		gb = { "<cmd>ToggleGHDash<cr>", "Toggle GH Dash" }, -- Replace 'ToggleGHDash' with the actual command
		gs = { "<cmd>SpotifyTUI<cr>", "Toggle Spotify TUI" }, -- Replace with the actual Spotify TUI toggle command
		vt = { "<cmd>ToggleLightDarkTheme<cr>", "Toggle Light/Dark Theme" }, -- Ensure this function is defined
		z = { "<cmd>UndotreeToggle<cr>", "Undotree" }, -- Undotree plugin
		f = {
			name = "Find (Telescope)",
			f = { "<cmd>Telescope find_files<cr>", "Find Files" },
			g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
			b = { "<cmd>Telescope buffers<cr>", "Buffers" },
		},
	},
})

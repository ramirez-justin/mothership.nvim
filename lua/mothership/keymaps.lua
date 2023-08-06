------ keymapping ------
local opts = { silent = true, noremap = true }
local term_opts = {silent = true}
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)

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


-- TERMINAL MODE --
-- terminal mode navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


-- PLUGINS --
-- Dashboard plugin and keymap
vim.keymap.set("n", "<leader>d", vim.cmd.Dashboard)
vim.keymap.set("n", "<C-c>", vim.cmd.bd)

-- -- Harpoon plugins and keymap
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
-- Add and view harpoon files
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
-- Navicate to saved files
vim.keymap.set("n", "<C-n>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-m>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-o>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-p>", function() ui.nav_file(4) end)

-- -- Undotree keymap
vim.keymap.set('n', '<leader>z', require('undotree').toggle,
    { noremap = true, silent = true })

-- Bufferline
vim.keymap.set("n", "<leader>gb", vim.cmd.BufferLinePick)


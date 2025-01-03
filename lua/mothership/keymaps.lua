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
-- Resizing panes
keymap("n", "<Left>", ":vertical resize +1<CR>", opts)
keymap("n", "<Right>", ":vertical resize -1<CR>", opts)
keymap("n", "<Up>", ":resize -1<CR>", opts)
keymap("n", "<Down>", ":resize +1<CR>", opts)

-- Remapping <gc> related mappings
keymap("n", "<gcL>", "<Plug>(comment_toggle_linewise)", opts)
keymap("n", "<gcO>", "<Plug>(comment_insert_above)", opts)
keymap("n", "<gco>", "<Plug>(comment_insert_below)", opts)
keymap("n", "<gcA>", "<Plug>(comment_insert_eol)", opts)
keymap("n", "<gcc>", "<Plug>(comment_toggle_linewise_current)", opts)

-- Remapping <gb> related mappings
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


-- TERMINAL MODE --
-- terminal mode navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
keymap("t", "jk", "<C-\\><C-n>", term_opts)


-- PLUGINS --
-- Dashboard plugin and keymap
vim.keymap.set("n", "<leader>d", vim.cmd.Dashboard)
vim.keymap.set("n", "<C-c>", vim.cmd.bd)

-- -- Undotree keymap
vim.keymap.set('n', '<leader>z', require('undotree').toggle,
    { noremap = true, silent = true })

-- Bufferline
vim.keymap.set("n", "<leader>gb", vim.cmd.BufferLinePick)

-- defintion or references
vim.keymap.set("n", "gd", require("definition-or-references").definition_or_references, { silent = true })

-- Dismiss Noice Message
vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", opts)

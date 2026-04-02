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

-- TERMINAL MODE --
-- Proper multi-line paste in terminal mode (use Ctrl+V instead of Cmd+V)
keymap("t", "<C-v>", function()
    local clipboard = vim.fn.getreg("+")
    vim.api.nvim_paste(clipboard, true, -1)
end, { desc = "Paste in terminal mode" })

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
    { "<leader>D",   group = "Database" }, -- Group for all database-related actions
    { "<leader>Du",  "<cmd>DBUI<CR>",                            desc = "Open DBUI Interface" },
    { "<leader>Dt",  "<cmd>DBUIToggle<CR>",                      desc = "Toggle DBUI Interface" },
    { "<leader>Da",  "<cmd>DBUIAddConnection<CR>",               desc = "Add DB Connection" },
    { "<leader>Df",  "<cmd>DBUIFindBuffer<CR>",                  desc = "Find DB Buffer" },
    { "<leader>Dr",  "<cmd>DBUIRenameBuffer<CR>",                desc = "Rename Buffer or Query" },
    { "<leader>Di",  "<cmd>DBUILastQueryInfo<CR>",               desc = "Last Query Info" },
    { "<leader>Dh",  "<cmd>DBUIHideNotifications<CR>",           desc = "Hide Notifications" },

    -- Remap query-related actions
    { "<Leader>Dqs", "<Plug>(DBUI_ExecuteQuery)",                desc = "Execute Query (Selection)" },
    { "<Leader>Dnn", "<Plug>(DBUI_ToggleResultLayout)",          desc = "Toggle Result Layout" },
    { "<Leader>Dde", "<Plug>(DBUI_EditBindParameters)",          desc = "Edit Bind Parameters" },

    -- Comment keymaps (built-in gc/gcc in Neovim 0.10+)
    { "gc",          group = "Comments" },
    { "gcc",         desc = "Toggle Line Comment" },

    -- Precommit group
    { "<leader>p",   group = "Precommit" }, -- Group for pre-commit-related actions
    { "<leader>pr",  "<cmd>Precommit<cr>",                       desc = "Run Precommit" },

    -- Quit and Save
    { "<leader>q",   "<cmd>q<cr>",                               desc = "Quit" },
    { "<leader>w",   "<cmd>w<cr>",                               desc = "Write File" },

    -- Undo history: use <leader>su (Snacks.picker.undo)
})

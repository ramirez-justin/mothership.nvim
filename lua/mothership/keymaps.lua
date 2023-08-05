------ keymapping ------
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<leader>d", vim.cmd.Dashboard)
vim.keymap.set("n", "<C-c>", vim.cmd.bd)

-- -- Harpoon plugins and keymap
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-n>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-m>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-o>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-p>", function() ui.nav_file(4) end)


-- -- Undotree keymap
vim.keymap.set('n', '<leader>z', require('undotree').toggle,
    { noremap = true, silent = true })


--Whichkey
local wk = require("which-key")
wk.register({
    b = { "<cmd>bnext<cr>" , "Switch Buffer" },
    f = {
        name = "Telescope", -- optional group name
        f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
        b = { "<cmd>Telescope buffers<cr>", "Buffers" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false }, -- additional options for creating the keymap
        g = { function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") }) end, "Grep > " }, -- you can also pass functions!
    },
    g = {
        name = "Lazygit",
        g =  {"<cmd>LazyGit<cr>", "Open LazyGit", noremap=false },
    },
    e = { ":NvimTreeToggle<cr>", "Toggle NVIM Tree" },
    --["1"] = "which_key_ignore",  -- special label to hide it in the popup
    w = { "<cmd>w<cr>", "Write File" },
    q = { "<cmd>q<cr>", "Quit" },
    h = { "<cmd>noh<cr>", "Remove Highlights" },
    d = "Dashboard",
    a = "Harpoon Add File",
    x = {
        name = "Trouble",
        x = { "<cmd>Trouble<cr>", "Trouble Toggle" },
        w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
        d = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics" },
        q = { "<cmd>Trouble quickfix<cr>", "Quickfix" },
        l = { "<cmd>Trouble loclist<cr>", "Loclist" },
    },
    z = "Undotree",
    r = "Rename",
},
{
    prefix = "<leader>",
    presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
    },
})


-- Bufferline
vim.keymap.set("n", "<leader>gb", vim.cmd.BufferLinePick)


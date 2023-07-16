------ keymapping ------
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Toggle Nvim-Tree
vim.keymap.set("n", "<leader>t", vim.cmd.NvimTreeToggle)

-- Easy Commands
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>so", vim.cmd.source)
vim.keymap.set("n", "<leader>h", vim.cmd.noh)
vim.keymap.set("n", "<leader>d", vim.cmd.Dashboard)
vim.keymap.set("n", "<leader>c", vim.cmd.bd)


-- LazyGit
vim.keymap.set("n", "<leader>gg" , vim.cmd.LazyGit)

-- Harpoon plugins and keymap
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-n>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-m>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-o>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-p>", function() ui.nav_file(4) end)

-- Telescope plugin and keymap
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<C-g>", builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set("n", "<leader>fg", function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- NVIM-Tree plugin and keymap
local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

-- Undotree keymap
vim.keymap.set('n', '<leader>x', require('undotree').toggle, 
{ noremap = true, silent = true })

-- Whichkey
local wk = require("which-key")
--wk.register(mappings, opts)
--wk.register({
  --f = {
    --name = "file", -- optional group name
    --f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    --r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
    --n = { "New File" }, -- just a label. don't create any mapping
    --e = "Edit File", -- same as above
    --["1"] = "which_key_ignore",  -- special label to hide it in the popup
    --b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
  --},
--}, { prefix = "<leader>" })

--Toggleterm
vim.keymap.set("n", "<C-t>", vim.cmd.ToggleTerm)

-- Bufferline
vim.keymap.set("n", "<leader>gb", vim.cmd.BufferLinePick)

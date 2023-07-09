------ keymapping ------
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Toggle Nvim-Tree
vim.keymap.set("n", "<leader>t", vim.cmd.NvimTreeToggle)

-- Easy Commands
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>h", vim.cmd.noh)

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
vim.keymap.set("n", "<leader>jf", builtin.find_files, {})
vim.keymap.set("n", "<C-g>", builtin.git_files, {})
vim.keymap.set("n", "<leader>js", function()
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

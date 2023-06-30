------ keymapping ------

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Set leader
vim.g.mapleader = " "

-- Toggle Nvim-Tree
vim.keymap.set("n", "<leader>jt", vim.cmd.NvimTreeToggle)

-- Packer sync
vim.keymap.set("n", "<leader>jr", vim.cmd.PackerSync)



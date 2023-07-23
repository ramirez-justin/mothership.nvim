vim.g.copilot_node_command = {"/opt/homebrew/Cellar/node@18/18.17.0/bin/node"}

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })


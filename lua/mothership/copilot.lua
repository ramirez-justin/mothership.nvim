vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-K>", 'copilot#Cancel()', { silent = true, expr = true })
vim.g.copilot_filetypes = {
    ["*"] = { "v:true" },
    }

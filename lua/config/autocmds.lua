-- Automatically set the `shiftwidth` and `tabstop` to 2 spaces for specific file types.
-- This ensures consistent indentation for files commonly written with 2-space indentation,
-- such as JavaScript, TypeScript, JSON, GraphQL, Markdown, and Terraform files.
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.json", "*.graphql", "*.md", "*.mdx", "*.tf" },
    callback = function()
        vim.bo.shiftwidth = 2
        vim.bo.tabstop = 2
    end,
})

-- Automatically check if the file has been modified outside of Neovim
-- whenever Neovim regains focus (e.g., switching back from another application)
-- or when entering a buffer. If the file has changed, Neovim will notify you
-- and give the option to reload it. This ensures you are always working with
-- the latest version of the file, reducing the risk of working on outdated content.
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
    pattern = { "*" },
    command = "checktime",
})

-- Automatically resizes all splits when the terminal window is resized:
vim.api.nvim_create_autocmd("VimResized", {
    desc = "Automatically resize splits when the window is resized",
    command = "wincmd =",
})

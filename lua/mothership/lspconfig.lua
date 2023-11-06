-- Mason
require("mason").setup({
    log_level = vim.log.levels.DEBUG,
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },
    },
})

require("mason-lspconfig").setup {
    ensure_installed = {
        "bashls",
        "cssls",
        "clangd",
        "dockerls",
        "gopls",
        "html",
        "jsonls",
        "lua_ls",
        "ruff_lsp",
        "rust_analyzer",
        "tsserver",
        "vimls",
        "yamlls",
    },
}

local on_attach = function(_, _)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ra', vim.lsp.buf.code_action, {})

    vim.keymap.set('n', 'rd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'ri', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'rr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.rename, {})
end


-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
    -- add any options here, or leave empty to use the default settings
})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end


-- Autocomplete
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' }
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
        },
    },
}
lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        documentFormatting = false,
    },
}
lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy",
            },
            cargo = {
                loadOutDirsFromCheck = true,
            },
            procMacro = {
                enable = true,
            },
        },
    },
}
lspconfig.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}
lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "clangd", "--background-index" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    init_options = {
        clangdFileStatus = true,
        usePlaceholders = true,
        completeUnimported = true,
        semanticHighlighting = true,
    },
    root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
}
lspconfig.html.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lspconfig.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lspconfig.dockerls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lspconfig.jsonls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lspconfig.vimls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lspconfig.yamlls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lspconfig.bashls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lspconfig.ruff_lsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}


-- Null-ls.nvim(none-ls)
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.completion.spell,
        null_ls.builtins.code_actions.proselint,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.completion.luasnip,

    },
})


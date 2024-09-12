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

--Mason helps to ensure that all the required lsp servers are installed
require("mason-lspconfig").setup {
    ensure_installed = {
        "bashls",
        "cssls",
        "clangd",
        "dockerls",
        "eslint",
        "html",
        "jsonls",
        "lua_ls",
        "ruff_lsp",
        "rust_analyzer",
        "terraformls",
        "ts_ls",
        "vimls",
        "yamlls",
        "jinja_lsp",
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


-- Autocomplete & LSP Configs
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

-- Setup for existing LSPs (Lua, TS, Rust, etc.)
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

lspconfig.ts_ls.setup {
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

lspconfig.eslint.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    -- Add additional ESLint config here as needed
    settings = {
        -- Example setting: auto-fix on save
        codeActionOnSave = {
            enable = true,
            mode = "all",
        },
        -- Specify ESLint configuration options here
        format = true, -- Enable or disable formatting
    },
}

lspconfig.terraformls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Setup for jinja-lsp
local configs = require('lspconfig.configs')

if not configs.jinja_lsp then
    configs.jinja_lsp = {
        default_config = {
            name = "jinja-lsp",
            cmd = { 'path_to_lsp_or_command' },
            filetypes = { 'jinja', 'rust' },
            root_dir = function()
                return "."
            end,
            init_options = {
                templates = './templates',
                backend = { './src' },
                lang = "rust"
            },
        },
    }
end

lspconfig.jinja_lsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}


-- Null-ls.nvim(none-ls)
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.codespell,
        null_ls.builtins.code_actions.proselint,
        null_ls.builtins.formatting.sqlfmt,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier.with({
            filetypes = {
                "javascript","typescript","css","scss","html",
                "json","yaml","markdown","graphql","md","txt",
                "yml"
            },
        }),
    },
})


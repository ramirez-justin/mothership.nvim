return {
    -- <http://github.com/williamboman/mason.nvim>
    {
        "williamboman/mason.nvim",
        opts = {
            log_level = vim.log.levels.DEBUG,
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },
    -- <http://williamboman.github.io/mason-lspconfig.nvim>
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            automatic_installation = true,
            ensure_installed = {
                "bashls",
                "cssls",
                "clangd",
                "dockerls",
                "eslint",
                "html",
                "jsonls",
                "lua_ls",
                "ruff",
                "rust_analyzer",
                "terraformls",
                "tflint",
                "ts_ls",
                "vimls",
                "yamlls",
                "jinja_lsp",
            },
        },
    },
    -- <https://github.com/neovim/nvim-lspconfig>
    { -- Configures Neovim's Built-in LSP Client
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            { "hrsh7th/cmp-nvim-lsp" },
        },
        opts = {},
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities =
                require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

            -- Shared `on_attach` function for key mappings and settings
            local on_attach = function(client, bufnr)
                local buf_map = function(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
                end

                buf_map("n", "gD", "<cmd>Telescope lsp_type_definitions<CR>", "Go to Type Definition")
                buf_map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Go to Definition")
                buf_map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
                buf_map("n", "gh", vim.lsp.buf.signature_help, "Signature Help")
                buf_map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Go to Implementation")
                buf_map("n", "gr", "<cmd>Telescope lsp_references<CR>", "Find References")
                buf_map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
                buf_map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
                buf_map("n", "<leader>ll", vim.lsp.codelens.run, "Run CodeLens")
                buf_map("n", "<leader>lR", vim.lsp.buf.rename, "Rename Symbol")

                -- Enable formatting if supported by the server
                if client.server_capabilities.documentFormattingProvider then
                    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
                end
            end

            -- Define LSP servers and their settings
            local servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = { version = "LuaJIT" },
                            diagnostics = { globals = { "vim" } },
                            workspace = { checkThirdParty = false },
                            telemetry = { enable = false },
                        },
                    },
                },
                rust_analyzer = {
                    settings = {
                        ["rust-analyzer"] = {
                            checkOnSave = { command = "clippy" },
                            cargo = { loadOutDirsFromCheck = true },
                            procMacro = { enable = true },
                        },
                    },
                },
                ts_ls = { settings = { documentFormatting = false } },
                clangd = {
                    cmd = { "clangd", "--background-index" },
                    filetypes = { "c", "cpp", "objc", "objcpp" },
                },
                terraformls = {
                    filetypes = { "terraform", "terraform-vars", "tf", "tfvars", "hcl", "tofu" },
                    settings = {
                        terraform = {
                            languageServer = {
                                enable = true,
                            },
                            validation = {
                                enableEnhancedValidation = true,
                                moduleCalls = true,
                                moduleVariables = true,
                                variables = true,
                            },
                        },
                    },
                },
                yamlls = {
                    settings = {
                        yaml = {
                            schemas = {
                                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                                -- ["../path/relative/to/file.yml"] = "/.github/workflows/*",
                            },
                        },
                    },
                },
            }
            -- General setup for all servers
            for server, config in pairs(servers) do
                lspconfig[server].setup(vim.tbl_extend("keep", config, {
                    on_attach = on_attach,
                    capabilities = capabilities,
                }))
            end

            -- Setup other servers without special configs
            local other_servers = {
                "bashls",
                "cssls",
                "dockerls",
                "eslint",
                "html",
                "jsonls",
                "ruff",
                "vimls",
                "jinja_lsp",
            }
            for _, server in ipairs(other_servers) do
                lspconfig[server].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end

            -- Auto-format on save for Terraform and Terragrunt files
            vim.api.nvim_create_autocmd({ "BufWritePre" }, {
                pattern = { "*.tf", "*.tfvars", "*.hcl", "terragrunt.hcl", "*.tofu" },
                callback = function()
                    vim.lsp.buf.format({
                        timeout_ms = 3000,
                        filter = function(client)
                            return client.name == "terraformls"
                        end,
                    })
                end,
                desc = "Format Terraform and Terragrunt files on save",
            })

            -- Auto-format on save for python files
            vim.api.nvim_create_autocmd({ "BufWritePre" }, {
                pattern = { "*.py", "*.pyi" },
                callback = function()
                    vim.lsp.buf.format({
                        async = false,
                        filter = function(client)
                            return client.name == "ruff" -- Replace with your preferred formatter
                        end,
                    })
                end,
                desc = "Format Python files on save",
            })
        end,
    },
    -- <https://github.com/nvimtools/none-ls.nvim>
    { -- Null-LS: Linters and Formatters
        "nvimtools/none-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = function()
            local null_ls = require("null-ls")
            return {
                sources = {
                    null_ls.builtins.completion.spell,
                    null_ls.builtins.diagnostics.codespell,
                    null_ls.builtins.code_actions.proselint,
                    null_ls.builtins.formatting.stylua,
                },
                on_attach = function(client)
                    if client:supports_method("textDocument/formatting") then
                        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
                    end
                end,
            }
        end,
    },
    --DEBUGGING
    { -- Trouble.nvim: Diagnostics and References UI
        "folke/trouble.nvim",
        opts = function(_, opts)
            return vim.tbl_deep_extend("force", opts, {
                modes = {
                    diagnostics = {
                        preview = {
                            type = "float",
                            relative = "editor",
                            border = "rounded",
                            title = "Preview",
                            title_pos = "center",
                            position = { 0, -2 },
                            size = { width = 0.3, height = 0.3 },
                            zindex = 200,
                        },
                    },
                },
                action_keys = {
                    hover = "K", -- opens a small popup with the full multiline message
                },
                auto_preview = true, -- automatically preview the location of the diagnostic
            })
        end,
        cmd = { "Trouble", "TroubleToggle" },
        keys = {
            { "<leader>xx", "<cmd>TroubleToggle<cr>",         desc = "Diagnostics (Trouble)" },
            { "<leader>xX", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
        },
    },
    { -- DAP (Debug Adapter Protocol) Setup
        "mfussenegger/nvim-dap",
        dependencies = {
            { "rcarriga/nvim-dap-ui" },
            { "mfussenegger/nvim-dap" },
            { "nvim-neotest/nvim-nio" },
        },
        config = function()
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
        end,
    },
}

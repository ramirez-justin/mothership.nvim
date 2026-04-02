return {
    -- Python DAP - defined separately to disable rocks
    { "mfussenegger/nvim-dap-python", rocks = { enabled = false } },

    -- Mason: Package manager for LSP servers, DAP servers, linters, and formatters
    -- https://github.com/williamboman/mason.nvim
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
        opts = {
            log_level = vim.log.levels.INFO,
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },

    -- LSP: Mason-lspconfig bridges Mason with Neovim's native LSP (0.11+ API).
    -- nvim-lspconfig is a dependency only — provides server defaults (cmd, filetypes, root_dir).
    -- https://github.com/williamboman/mason-lspconfig.nvim
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            -- Global capabilities for all servers
            vim.lsp.config("*", {
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })

            -- Per-server settings
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim", "Snacks" } },
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                },
            })
            vim.lsp.config("rust_analyzer", {
                settings = {
                    ["rust-analyzer"] = {
                        check = { command = "clippy" },
                        cargo = { buildScripts = { enable = true } },
                        procMacro = { enable = true },
                        inlayHints = { locationLinks = false },
                    },
                },
            })
            vim.lsp.config("ts_ls", {
                settings = {
                    documentFormatting = false,
                    typescript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                        },
                    },
                    javascript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                        },
                    },
                },
            })
            vim.lsp.config("clangd", {
                cmd = { "clangd", "--background-index", "--clang-tidy" },
                filetypes = { "c", "cpp", "objc", "objcpp" },
                init_options = {
                    clangdFileStatus = true,
                    usePlaceholders = true,
                    completeUnimported = true,
                },
            })
            vim.lsp.config("terraformls", {
                filetypes = { "terraform", "terraform-vars", "tf", "tfvars", "hcl", "tofu" },
                settings = {
                    terraform = {
                        languageServer = { enable = true },
                        validation = {
                            enableEnhancedValidation = true,
                            moduleCalls = true,
                            moduleVariables = true,
                            variables = true,
                        },
                    },
                },
            })
            vim.lsp.config("yamlls", {
                settings = {
                    yaml = {
                        schemas = {
                            ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                            ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.yml",
                            ["https://json.schemastore.org/github-action.json"] = "action.yml",
                        },
                        validate = true,
                        format = { enable = true },
                    },
                },
            })
            vim.lsp.config("ruff", {
                settings = { ruff = { lint = { run = "onSave" } } },
            })

            -- Mason-lspconfig: ensure servers are installed
            -- stylua is a formatter, not an LSP — exclude from auto-enable
            require("mason-lspconfig").setup({
                automatic_enable = { exclude = { "stylua" } },
                ensure_installed = {
                    "lua_ls", "rust_analyzer", "clangd", "ts_ls", "ruff",
                    "cssls", "html", "jsonls", "eslint",
                    "bashls", "dockerls", "terraformls", "tflint", "yamlls",
                    "gopls", "sqlls", "vimls", "jinja_lsp",
                },
            })

            -- Keymaps on LSP attach
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local bufnr = args.buf
                    local map = function(mode, lhs, rhs, desc)
                        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
                    end
                    map("n", "K",           vim.lsp.buf.hover,         "Hover Documentation")
                    map("n", "gh",          vim.lsp.buf.signature_help, "Signature Help")
                    map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, "Previous Diagnostic")
                    map("n", "]d", function() vim.diagnostic.jump({ count = 1 })  end, "Next Diagnostic")
                    map("n", "<leader>ll",  vim.lsp.codelens.run,       "Run CodeLens")
                    map("n", "<leader>lR",  vim.lsp.buf.rename,         "Rename Symbol")
                    map("n", "<leader>la",  vim.lsp.buf.code_action,    "Code Action")
                    map("n", "<leader>lf",  function() vim.lsp.buf.format({ async = true }) end, "Format Document")
                end,
            })

            -- Format on save via LSP
            local function fmt_on_save(pattern, server)
                vim.api.nvim_create_autocmd("BufWritePre", {
                    pattern = pattern,
                    callback = function()
                        vim.lsp.buf.format({
                            timeout_ms = 3000,
                            filter = function(client) return client.name == server end,
                        })
                    end,
                })
            end
            fmt_on_save({ "*.tf", "*.tfvars", "*.hcl", "terragrunt.hcl", "*.tofu" }, "terraformls")
            fmt_on_save({ "*.py", "*.pyi" }, "ruff")
            fmt_on_save({ "*.rs" }, "rust_analyzer")
        end,
    },

    -- None-LS (null-ls): Non-LSP sources like linters and formatters
    -- https://github.com/nvimtools/none-ls.nvim
    {
        "nvimtools/none-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = function()
            local null_ls = require("null-ls")
            return {
                sources = {
                    -- Completions
                    null_ls.builtins.completion.spell,

                    -- Diagnostics
                    null_ls.builtins.diagnostics.codespell,
                    null_ls.builtins.diagnostics.markdownlint,

                    -- Code actions
                    null_ls.builtins.code_actions.proselint,
                    null_ls.builtins.code_actions.gitsigns,

                    -- Formatting
                    null_ls.builtins.formatting.sqlfmt,
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.prettier.with({
                        filetypes = {
                            "javascript",
                            "typescript",
                            "css",
                            "scss",
                            "html",
                            "json",
                            "yaml",
                            "markdown",
                            "graphql",
                        },
                    }),
                    null_ls.builtins.formatting.shfmt,
                },
                on_attach = function(client, bufnr)
                    if client:supports_method("textDocument/formatting") then
                        local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = false })
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({
                                    filter = function(formatting_client)
                                        return formatting_client.name == "null-ls"
                                    end,
                                    bufnr = bufnr,
                                })
                            end,
                        })
                    end
                end,
            }
        end,
    },

    -- Trouble: Better UI for diagnostics, references, etc.
    -- https://github.com/folke/trouble.nvim
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },

    -- DAP: Debug Adapter Protocol Setup
    -- https://github.com/mfussenegger/nvim-dap
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
            "leoluz/nvim-dap-go",
            "mfussenegger/nvim-dap-python",
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")

            -- Configure DAP UI
            dapui.setup({
                icons = { expanded = "▾", collapsed = "▸", current_frame = "→" },
                mappings = {
                    expand = { "<CR>", "<2-LeftMouse>" },
                    open = "o",
                    remove = "d",
                    edit = "e",
                    repl = "r",
                    toggle = "t",
                },
                layouts = {
                    {
                        elements = {
                            { id = "scopes", size = 0.25 },
                            "breakpoints",
                            "stacks",
                            "watches",
                        },
                        size = 40,
                        position = "left",
                    },
                    {
                        elements = {
                            "repl",
                            "console",
                        },
                        size = 10,
                        position = "bottom",
                    },
                },
                floating = {
                    max_height = nil,
                    max_width = nil,
                    border = "rounded",
                    mappings = {
                        close = { "q", "<Esc>" },
                    },
                },
                windows = { indent = 1 },
                render = {
                    max_type_length = nil,
                    max_value_lines = 100,
                },
            })

            -- Auto open/close DAP UI
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            -- Configure DAP virtual text
            require("nvim-dap-virtual-text").setup({
                enabled = true,
                enabled_commands = true,
                highlight_changed_variables = true,
                highlight_new_as_changed = false,
                show_stop_reason = true,
                commented = false,
                virt_text_pos = "eol",
                all_frames = false,
                virt_lines = false,
                virt_text_win_col = nil,
            })

            -- Set up language-specific debugging
            require("dap-go").setup()
            require("dap-python").setup("uv")

            -- Key mappings for debugging
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
            vim.keymap.set("n", "<leader>dB", function()
                dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end, { desc = "Conditional Breakpoint" })
            vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
            vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step Over" })
            vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
            vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Step Out" })
            vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
            vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Run Last" })
            vim.keymap.set("n", "<leader>dt", dapui.toggle, { desc = "Toggle DAP UI" })
        end,
    },
}

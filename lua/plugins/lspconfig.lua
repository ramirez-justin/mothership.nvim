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
            log_level = vim.log.levels.INFO, -- Changed from DEBUG to INFO for less verbose logs
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },

    -- Mason-LSPConfig: Bridge between Mason and LSP config
    -- https://github.com/williamboman/mason-lspconfig.nvim
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            automatic_installation = true,
            ensure_installed = {
                -- Languages
                "lua_ls", -- Lua
                "rust_analyzer", -- Rust
                "clangd", -- C/C++
                "ts_ls", -- TypeScript
                "ruff", -- Python

                -- Web development
                "cssls", -- CSS
                "html", -- HTML
                "jsonls", -- JSON
                "eslint", -- JavaScript/TypeScript linting

                -- DevOps
                "bashls", -- Bash
                "dockerls", -- Docker
                "terraformls", -- Terraform
                "tflint", -- Terraform linting
                "yamlls", -- YAML

                -- Others
                "vimls", -- Vim script
                "jinja_lsp", -- Jinja templates
            },
        },
    },

    -- LSP Config: Configure Neovim's built-in LSP client
    -- https://github.com/neovim/nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local capabilities =
                require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

            -- Shared `on_attach` function for key mappings and settings
            local on_attach = function(client, bufnr)
                local buf_map = function(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
                end

                -- Navigation handled by Snacks picker (snacks.lua)
                -- gd, gD, gi, gr, gy are mapped globally there

                -- Documentation
                buf_map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
                buf_map("n", "gh", vim.lsp.buf.signature_help, "Signature Help")

                -- Diagnostics
                buf_map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
                buf_map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")

                -- Actions
                buf_map("n", "<leader>ll", vim.lsp.codelens.run, "Run CodeLens")
                buf_map("n", "<leader>lR", vim.lsp.buf.rename, "Rename Symbol")
                buf_map("n", "<leader>la", vim.lsp.buf.code_action, "Code Action")
                buf_map("n", "<leader>lf", function()
                    vim.lsp.buf.format({ async = true })
                end, "Format Document")
            end

            -- Format on save configuration (centralized)
            local format_on_save = function(pattern, server_name, opts)
                opts = opts or {}
                vim.api.nvim_create_autocmd("BufWritePre", {
                    pattern = pattern,
                    callback = function()
                        vim.lsp.buf.format({
                            timeout_ms = opts.timeout_ms or 3000,
                            async = opts.async or false,
                            filter = function(client)
                                return client.name == server_name
                            end,
                        })
                    end,
                    desc = "Format " .. table.concat(pattern, "/") .. " files on save with " .. server_name,
                })
            end

            -- Define LSP servers and their settings
            local servers = {
                -- Lua
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = { version = "LuaJIT" },
                            diagnostics = { globals = { "vim", "Snacks" } },
                            workspace = { checkThirdParty = false, library = vim.api.nvim_get_runtime_file("", true) },
                            telemetry = { enable = false },
                        },
                    },
                },

                -- Rust
                rust_analyzer = {
                    settings = {
                        ["rust-analyzer"] = {
                            checkOnSave = { command = "clippy" },
                            cargo = { loadOutDirsFromCheck = true },
                            procMacro = { enable = true },
                            inlayHints = { locationLinks = false },
                        },
                    },
                },

                -- TypeScript/JavaScript
                ts_ls = {
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
                },

                -- C/C++
                clangd = {
                    cmd = { "clangd", "--background-index", "--clang-tidy" },
                    filetypes = { "c", "cpp", "objc", "objcpp" },
                    init_options = {
                        clangdFileStatus = true,
                        usePlaceholders = true,
                        completeUnimported = true,
                    },
                },

                -- Terraform
                terraformls = {
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
                },

                -- YAML
                yamlls = {
                    settings = {
                        yaml = {
                            schemas = {
                                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
                                "docker-compose*.yml",
                                ["https://json.schemastore.org/github-action.json"] = "action.yml",
                            },
                            validate = true,
                            format = { enable = true },
                        },
                    },
                },

                -- Python
                ruff = {
                    settings = {
                        ruff = {
                            lint = { run = "onSave" },
                        },
                    },
                },

                -- Simple servers (no special config needed)
                bashls = {},
                cssls = {},
                dockerls = {},
                eslint = {},
                html = {},
                jsonls = {},
                vimls = {},
                jinja_lsp = {},
            }

            -- Setup all servers
            for server_name, config in pairs(servers) do
                config = config or {}
                vim.lsp.config[server_name] = vim.tbl_extend("force", {
                    cmd = config.cmd,
                    filetypes = config.filetypes,
                    root_dir = config.root_dir,
                    init_options = config.init_options,
                    settings = config.settings,
                    on_attach = on_attach,
                    capabilities = capabilities,
                }, config)
            end

            -- Format on save configurations
            format_on_save({ "*.tf", "*.tfvars", "*.hcl", "terragrunt.hcl", "*.tofu" }, "terraformls")
            format_on_save({ "*.py", "*.pyi" }, "ruff")
            format_on_save({ "*.lua" }, "lua_ls")
            format_on_save({ "*.rs" }, "rust_analyzer")
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
                -- Format-on-save handled centrally in lspconfig.lua
                -- Use <leader>lf for manual formatting with null-ls sources
            }
        end,
    },

    -- Trouble: Better UI for diagnostics, references, etc.
    -- https://github.com/folke/trouble.nvim
    {
        "folke/trouble.nvim",
        opts = { vim.diagnostic.config({ virtual_text = true }) }, -- for default options, refer to the configuration section for custom setup.
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
            "leoluz/nvim-dap-go",  -- Go debugging
            "mfussenegger/nvim-dap-python", -- Python debugging
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")

            -- Configure DAP UI
            dapui.setup({
                icons = { expanded = "▾", collapsed = "▸", current_frame = "→" },
                mappings = {
                    -- Use a table to apply multiple mappings
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

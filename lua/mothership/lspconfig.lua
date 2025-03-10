-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
	library = { plugins = { "nvim-dap-ui" }, types = true },
	-- add any options here, or leave empty to use the default settings
})

-- Mason
require("mason").setup({
	log_level = vim.log.levels.DEBUG,
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

--Mason helps to ensure that all the required lsp servers are installed
require("mason-lspconfig").setup({
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
		"ts_ls",
		"vimls",
		"yamlls",
		"jinja_lsp",
		"tflint",
	},
})

-- Autocomplete & LSP Configs
local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
	local opts = { noremap = true, silent = true }

	buf_set_keymap("n", "gD", "<cmd>Telescope lsp_type_definitions<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", opts)
	buf_set_keymap("n", "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	client.server_capabilities.document_formatting = true
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.textDocument.hover = { dynamicRegistration = false }
capabilities.textDocument.signatureHelp = { dynamicRegistration = false }

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

-- Setup for existing LSPs (Lua, TS, Rust, etc.)
lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
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
})

lspconfig.ts_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		documentFormatting = false,
	},
})

lspconfig.rust_analyzer.setup({
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
})

lspconfig.clangd.setup({
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
})

lspconfig.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.dockerls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.vimls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.yamlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.bashls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.ruff.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.eslint.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = true
		on_attach(client, bufnr) -- Attach shared keybindings
	end,
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
})

lspconfig.terraformls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Setup for jinja-lsp
local configs = require("lspconfig.configs")

if not configs.jinja_lsp then
	configs.jinja_lsp = {
		default_config = {
			name = "jinja-lsp",
			cmd = { "path_to_lsp_or_command" },
			filetypes = { "jinja", "rust" },
			root_dir = lspconfig.util.root_pattern(".git", "setup.py", "pyproject.toml", "package.json"),
			init_options = {
				templates = "./templates",
				backend = { "./src" },
				lang = "rust",
			},
		},
	}
end

lspconfig.jinja_lsp.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Null-ls.nvim(none-ls)
local has_null_ls, null_ls = pcall(require, "null-ls")
if has_null_ls then
	null_ls.setup({
		sources = {
			null_ls.builtins.completion.spell,
			null_ls.builtins.diagnostics.codespell,
			null_ls.builtins.code_actions.proselint,
			null_ls.builtins.formatting.sqlfmt,
			null_ls.builtins.formatting.black,
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.terraform_fmt,
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
					"md",
					"txt",
					"yml",
				},
			}),
			null_ls.builtins.diagnostics.terraform_validate,
			null_ls.builtins.diagnostics.sqlfluff.with({
				extra_args = { "--dialect", "postgres" }, -- change to your dialect
			}),
		},
		-- format on save
		on_attach = function(client)
			if client.supports_method("textDocument/formatting") then
				vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
			end
		end,
	})
else
	vim.notify("null-ls not found", vim.log.levels.ERROR)
end

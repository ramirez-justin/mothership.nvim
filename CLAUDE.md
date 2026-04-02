# Neovim Config — Claude Code Instructions

## Environment

- **Neovim**: 0.12.0 (stable)
- **OS**: macOS (aarch64)
- **Plugin manager**: lazy.nvim (stable branch)
- **Config root**: `~/.config/nvim/`

## Structure

```
init.lua                    -- Entrypoint: loads config.options, config.lazy, config.autocmds
lua/
  config/
    options.lua             -- vim.opt settings, vim.diagnostic.config, providers
    keymaps.lua             -- Global keymaps (loaded via which-key in common.lua)
    autocmds.lua            -- Global autocmds
    lazy.lua                -- lazy.nvim bootstrap and setup (rocks disabled)
  plugins/
    lspconfig.lua           -- Mason + LSP + none-ls + DAP (all in one file)
    snacks.lua              -- snacks.nvim (picker, dashboard, image, input, notifier, etc.)
    treesitter.lua          -- nvim-treesitter (main branch)
    completions.lua         -- nvim-cmp + copilot
    git.lua                 -- gitsigns, git-blame, octo, diffnav, pre-commit
    ui.lua                  -- lualine, which-key, other UI plugins
    colorscheme.lua         -- Theme (rose-pine)
    markdown.lua            -- render-markdown.nvim
    sql.lua                 -- vim-dadbod-ui
    common.lua              -- Misc plugins (todo-comments, neogen, etc.)
    compiler.lua            -- compiler.nvim
    ai_assist.lua           -- AI plugins
docs/
  git-workflow.md           -- Git keybinds reference
```

## LSP Architecture

All LSP configuration lives in `lua/plugins/lspconfig.lua` in a **single non-lazy block** under `mason-lspconfig.nvim`:

1. `vim.lsp.config("*", { capabilities })` — global capabilities via cmp-nvim-lsp
2. `vim.lsp.config("server", {...})` — per-server settings (Neovim 0.11+ native API)
3. `require("mason-lspconfig").setup({...})` — installs servers, excludes `stylua` from auto-enable
4. `LspAttach` autocmd — only `gh` (signature help) and `<leader>lf` (format); everything else is a 0.12 default
5. `fmt_on_save()` — BufWritePre format for terraform, python, rust

`neovim/nvim-lspconfig` is a **dependency only** (provides server defaults: cmd, filetypes, root_dir). It has no separate lazy spec.

### 0.12 Default LSP Keymaps (do not re-map these)
`K` hover · `grn` rename · `gra` code action · `grr` references · `gri` implementation · `grt` type def · `grx` codelens

### LSP Navigation (Snacks picker overrides)
`gd` def · `gD` decl · `gr` refs · `gI` impl · `gy` type def — all open in Snacks picker

## Treesitter

- Branch: `main` (Neovim 0.12 rewrite — incompatible with `master`)
- Requires `tree-sitter` CLI: `cargo install tree-sitter-cli --locked`
- No `nvim-treesitter.configs` — use `require("nvim-treesitter").install({...})`
- Fold expr: `v:lua.vim.treesitter.foldexpr()` (not `nvim_treesitter#foldexpr()`)

## Key Keybinds (non-obvious)

| Key | Action |
|-----|--------|
| `<leader>M` | Mason |
| `<leader>e` | File explorer (Snacks picker) |
| `<leader>gg` | Lazygit |
| `<leader>gD` | gh-dash in floating terminal |
| `<C-\>` | Toggle floating terminal |
| `<C-a>` | Toggle Claude Code terminal |
| `gh` | LSP signature help |
| `<leader>lf` | LSP format document |

## Formatters (none-ls)

| Filetype | Formatter |
|----------|-----------|
| Lua | stylua |
| JS/TS/CSS/HTML/JSON/YAML/MD | prettier |
| Python | ruff (also via LSP format-on-save) |
| Rust | rust_analyzer (format-on-save) |
| Terraform | terraformls (format-on-save) |
| SQL | sqlfmt |
| Shell | shfmt |

## Known Headless Checkhealth False-Positives

These errors appear when running `nvim --headless "+checkhealth"` but work correctly in interactive mode:

- `vim.ui.input` not set to `Snacks.input` — Snacks defers input/picker to `UIEnter` which never fires headless
- `vim.ui.select` not set to `Snacks.picker.select` — same reason
- `dashboard: setup did not run` — no TTY headless
- `$TERM differs from tmux default-terminal` — existing session; new panes get `tmux-256color`

## tmux Requirements

```
default-terminal  tmux-256color
terminal-overrides  xterm-ghostty:RGB:Tc
allow-passthrough on   # kitty graphics protocol for snacks.image
```

## Conventions

- Plugins are grouped by function into files under `lua/plugins/`
- Lazy-load via `event`, `cmd`, or `keys` where possible; exceptions noted with `lazy = false`
- `vim.lsp.config()` must be called at startup (non-lazy); capabilities set globally via `vim.lsp.config("*", ...)`
- Diagnostic signs configured via `vim.diagnostic.config({ signs = { text = {...} } })` — `sign_define()` removed in 0.12

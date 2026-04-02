# mothership.nvim

A personal Neovim 0.12 configuration built on [lazy.nvim](https://github.com/folke/lazy.nvim).

## Prerequisites

**Required**
- Neovim >= 0.12.0
- [lazy.nvim](https://github.com/folke/lazy.nvim) (auto-bootstrapped)
- `git`, `curl`, `tar`, `unzip` (for Mason)
- A [Nerd Font](https://www.nerdfonts.com/) (icons throughout)
- `ripgrep` — grep engine for Snacks picker
- `fd` — file finder for Snacks picker
- `node` + `npm` — many LSP servers
- `cargo` / `rustc` >= 1.88 — Rust LSP and `tree-sitter-cli`
- `tree-sitter-cli` — required by nvim-treesitter main branch

  ```sh
  cargo install tree-sitter-cli --locked
  ```

**Recommended**
- `lazygit` — full git UI (`<leader>gg`)
- `gh` — GitHub CLI (dashboard, PR list)
- `stylua`, `prettier`, `shfmt` — formatters (or install via Mason)
- `ImageMagick` (`magick`) — image rendering in docs
- [Ghostty](https://ghostty.org/) terminal — best experience for image rendering

**tmux** (if used)
```
default-terminal  tmux-256color
terminal-overrides  xterm-ghostty:RGB:Tc
allow-passthrough on
```

## Installation

Back up existing config:
```sh
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak   # optional
mv ~/.local/state/nvim ~/.local/state/nvim.bak   # optional
```

Clone:
```sh
git clone https://github.com/ramirez-justin/mothership.nvim ~/.config/nvim
```

Start Neovim — lazy.nvim bootstraps itself and installs all plugins:
```sh
nvim
```

LSP servers, formatters, and linters install automatically via Mason on first open.
Run `:TSUpdate` to compile treesitter parsers after first launch.

Verify setup:
```
:checkhealth
```

## Key Features

- **[Snacks.nvim](https://github.com/folke/snacks.nvim)** — fuzzy picker, file explorer, dashboard, floating terminals, image rendering, notifications
- **LSP** via Mason + mason-lspconfig + Neovim 0.12 native `vim.lsp.config` API
- **Treesitter** via `nvim-treesitter` main branch (0.12 rewrite)
- **Completion** via nvim-cmp + Copilot
- **Formatting/linting** via none-ls (stylua, prettier, ruff, sqlfmt, shfmt)
- **Debugging** via nvim-dap (Go, Python, with UI)
- **Git** via gitsigns, Lazygit, octo.nvim (PR review), git-blame
- **AI** via Copilot + avante.nvim

## Notable Keybinds

| Key | Action |
|-----|--------|
| `<leader><space>` | Smart file finder |
| `<leader>e` | File explorer |
| `<leader>gg` | Lazygit |
| `<leader>gD` | gh-dash (GitHub dashboard) |
| `<C-\>` | Floating terminal |
| `<C-a>` | Claude Code terminal |
| `<leader>M` | Mason |
| `gd` / `gr` / `gI` / `gy` | LSP nav (Snacks picker) |
| `K` / `gh` | Hover / signature help |
| `grn` / `gra` / `grx` | Rename / code action / codelens (0.12 defaults) |

See `docs/git-workflow.md` for full git keybind reference.

## Structure

```
lua/
  config/         options, keymaps, autocmds, lazy bootstrap
  plugins/        one file per feature domain
docs/             reference docs
CLAUDE.md         instructions for Claude Code sessions
```

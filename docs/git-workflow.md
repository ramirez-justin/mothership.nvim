# Git Workflow in Neovim

Tools and keybindings for working with Git and GitHub without leaving the editor.

## Day-to-Day Git

| Keybind | Action | Tool |
|---------|--------|------|
| `<leader>gg` | Open Lazygit (stage, commit, push, rebase) | Snacks |
| `<leader>gs` | Git status picker | Snacks |
| `<leader>gb` | Git branches picker | Snacks |
| `<leader>gl` | Git log picker | Snacks |
| `<leader>gL` | Git log (current line) | Snacks |
| `<leader>gd` | Git diff hunks | Snacks |
| `<leader>gf` | Git log (current file) | Snacks |
| `<leader>gB` | Open in GitHub browser | Snacks |
| `<leader>gS` | Git stash | Snacks |

## Gutter Signs

**gitsigns.nvim** shows added/modified/deleted lines in the sign column. Loads automatically on file open.

## Blame

**git-blame.nvim** shows blame info as virtual text. Disabled by default.

| Command | Action |
|---------|--------|
| `:GitBlameEnable` | Turn on inline blame |
| `:GitBlameDisable` | Turn off inline blame |
| `:GitBlameToggle` | Toggle inline blame |

## GitHub PR Review

**octo.nvim** lets you review PRs, leave comments, and approve/request changes inside Neovim.

| Keybind / Command | Action |
|-------------------|--------|
| `<leader>go` | List open PRs |
| `:Octo pr list` | List PRs |
| `:Octo pr edit <number>` | Open a specific PR |
| `:Octo review start` | Start a PR review |
| `:Octo comment add` | Add review comment |
| `:Octo pr merge` | Merge a PR |

## GitHub Dashboard

**gh-dash** is a terminal UI for triaging PRs and issues.

| Keybind | Action |
|---------|--------|
| `<leader>gD` | Open gh-dash in floating terminal |

## Diff Viewing

**diffnav** is the global git diff pager. Any `git diff` output renders with a file tree sidebar.

Configured outside Neovim via:
```
brew install dlvhdr/formulae/diffnav
git config --global core.pager "diffnav"
```

## Pre-commit

**pre-commit.nvim** runs pre-commit hooks.

| Command | Action |
|---------|--------|
| `:Precommit` | Run pre-commit hooks |

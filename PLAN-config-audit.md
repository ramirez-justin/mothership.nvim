# Neovim Configuration Audit Plan

**Date:** 2026-01-08
**Purpose:** Best practices audit and cleanup of Neovim configuration

---

## High Priority (Functional Issues)

### 1. Fix Keymap Conflicts

| Key | Location 1 | Location 2 | Resolution |
|-----|-----------|-----------|------------|
| `gd` | `lspconfig.lua:80` (Telescope) | `snacks.lua:567` (Snacks) | Remove from lspconfig on_attach |
| `gD` | `lspconfig.lua:79` (Telescope) | `snacks.lua:573` (Snacks) | Remove from lspconfig on_attach |
| `gr` | `lspconfig.lua:82` (Telescope) | `snacks.lua:581` (Snacks) | Remove from lspconfig on_attach |
| `gi` | `lspconfig.lua:81` (Telescope) | `snacks.lua:589` (Snacks) | Remove from lspconfig on_attach |
| `<leader>z` | `keymaps.lua:89` (UndotreeToggle) | `snacks.lua:618` (Snacks.zen) | Remap undotree to `<leader>U` |
| `<leader>n` | `snacks.lua:281` (picker.notifications) | `snacks.lua:647` (notifier.show_history) | Remove duplicate at line 281 |
| `<leader>sb` | `snacks.lua:389` | `snacks.lua:440` | Remove duplicate at line 440 |
| `<leader>bd` | `snacks.lua:654` (bufdelete) | `keymaps.lua:55` (Database prefix) | Change database prefix to `<leader>D` |

### 2. Fix Malformed Which-Key Groups

**File:** `keymaps.lua:70-71`

```lua
-- BEFORE (incorrect)
{ "<gc>", group = "Linewise Comments" }
{ "<gb>", group = "Blockwise Comments" }

-- AFTER (correct)
{ "gc", group = "Linewise Comments" }
{ "gb", group = "Blockwise Comments" }
```

### 3. Remove Duplicate Keymap Definitions

**File:** `keymaps.lua`

Remove duplicates - `<leader>q` and `<leader>w` are defined at:
- Lines 7, 10 (vim.keymap.set)
- Lines 85-86 (wk.add)
- Lines 94-95 (wk.add nested)

Keep only the which-key definitions at lines 85-86.

### 4. Resolve LSP Navigation (Telescope vs Snacks)

**Decision:** Use Snacks pickers exclusively

**File:** `lspconfig.lua`

- Remove `nvim-telescope/telescope.nvim` from dependencies (line 66)
- Remove gd/gD/gi/gr mappings from `on_attach` function (lines 79-82)
- Keep K, gh, [d, ]d, and `<leader>l*` mappings in on_attach (these are unique)

### 5. Resolve Format-on-Save Conflicts

**Issue:** Both `lspconfig.lua` and `none-ls.lua` define format-on-save autocmds.

**Resolution:** Centralize in lspconfig.lua, remove from none-ls.lua

**File:** `none-ls.lua`
- Remove the entire `on_attach` function (lines 293-312)
- Keep only the `sources` configuration

**File:** `lspconfig.lua`
- Add prettier filetypes to format_on_save if not already covered by an LSP

---

## Medium Priority (Cleanup/Redundancy)

### 6. Remove Deprecated Treesitter Playground

**File:** `treesitter.lua:6`

```lua
-- BEFORE
dependencies = "nvim-treesitter/playground",

-- AFTER
-- Remove this line entirely (use built-in :InspectTree)
```

### 7. Choose One Notification System

**Decision:** Use Snacks.notifier (already configured)

**File:** `ui.lua:176-184`

```lua
-- BEFORE
{
    "rcarriga/nvim-notify",
    opts = {
        background_colour = "#1e1e2e",
        stages = "fade_in_slide_out",
        timeout = 5000,
    },
},

-- AFTER
-- Remove nvim-notify from noice dependencies, or disable Snacks.notifier
-- Recommendation: Keep Snacks.notifier, configure noice to not use nvim-notify
```

### 8. Choose One Undo Visualization

**Decision:** Use Snacks.picker.undo() (already mapped to `<leader>su`)

**File:** `ui.lua:188-192`

```lua
-- Remove this entire block
{
    "jiaoshijie/undotree",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
},
```

**File:** `keymaps.lua:89`
```lua
-- Remove this line
{ "<leader>z", "<cmd>UndotreeToggle<cr>", desc = "UndoTree" },
```

### 9. Remove Unused definition-or-references.nvim

**File:** `ui.lua:78-81`

```lua
-- Remove this block (no keymaps configured, Snacks handles this)
{
    "KostkaBrukowa/definition-or-references.nvim",
    opts = {},
},
```

### 10. Remove Telescope Dependency

After completing item #4, if Telescope is no longer used anywhere:

**File:** `lspconfig.lua:66`
```lua
-- Remove from dependencies
"nvim-telescope/telescope.nvim",
```

Check if any other files reference Telescope before fully removing.

---

## Low Priority (Polish)

### 11. Add Lazy Loading to Git Plugins

**File:** `git.lua`

```lua
-- BEFORE
{ "lewis6991/gitsigns.nvim" },

-- AFTER
{ "lewis6991/gitsigns.nvim", event = "BufReadPre" },
```

```lua
-- BEFORE
{ "f-person/git-blame.nvim", ... }

-- AFTER
{ "f-person/git-blame.nvim", cmd = "GitBlameToggle", ... }
```

```lua
-- BEFORE
{ "ttibsi/pre-commit.nvim" },

-- AFTER
{ "ttibsi/pre-commit.nvim", cmd = "Precommit" },
```

### 12. Remove Redundant Dependency Declarations

**File:** `completions.lua`

Lines 4-28 declare plugins with their own specs. Lines 34-47 list them again as dependencies. Remove the dependencies block and rely on the standalone specs with their `event` triggers.

### 13. Remove Outdated Version Check

**File:** `options.lua:60-63`

```lua
-- Remove this entire block (you're on 0.10+)
if vim.fn.has("nvim-0.9.0") == 1 then
    opt.splitkeep = "screen"
    opt.shortmess:append({ C = true })
end

-- Just add directly:
opt.splitkeep = "screen"
opt.shortmess:append({ C = true })
```

### 14. Fix Fold Settings Contradiction

**File:** `options.lua:56-57`

```lua
-- BEFORE (contradictory)
opt.foldlevel = 999        -- Opens all folds
opt.foldlevelstart = 2     -- Ineffective because foldlevel overrides

-- AFTER (pick one approach)
-- Option A: All folds open by default
opt.foldlevelstart = 99

-- Option B: Folds closed at level 2+
opt.foldlevelstart = 2
-- (remove foldlevel = 999)
```

### 15. Clean Up Commented Code

Remove these commented blocks:
- `keymaps.lua:101-118` - gh-dash terminal, theme toggle
- `ai_assist.lua:1-83` - avante.nvim block
- `git.lua:15-25` - copilot block
- `common.lua:33-49` - blink.cmp block

Optional: Remove `lua/practice.lua` if not needed.

### 16. Add YAML to 2-Space Indent Autocmd

**File:** `autocmds.lua:5`

```lua
-- BEFORE
pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.json", "*.graphql", "*.md", "*.mdx", "*.tf" },

-- AFTER
pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.json", "*.graphql", "*.md", "*.mdx", "*.tf", "*.yaml", "*.yml" },
```

---

## Implementation Order

1. **Phase 1 - Critical Fixes** (Items 1-5)
   - Fix all keymap conflicts
   - Consolidate LSP navigation to Snacks
   - Fix format-on-save

2. **Phase 2 - Plugin Cleanup** (Items 6-10)
   - Remove deprecated/redundant plugins
   - Simplify notification and undo systems

3. **Phase 3 - Polish** (Items 11-16)
   - Add lazy loading
   - Clean up code
   - Fix minor issues

---

## Verification

After each phase:
1. Run `:checkhealth`
2. Run `:Lazy` and verify no errors
3. Test affected keymaps
4. Verify LSP works: open a Lua file, test `gd`, `gr`, `K`
5. Verify format-on-save works

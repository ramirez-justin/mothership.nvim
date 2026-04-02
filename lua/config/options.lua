local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.wo.relativenumber = true
vim.wo.number = true

opt.autoindent = true          -- Enable autoindent
opt.autowrite = true           -- Enable auto write
opt.clipboard = "unnamedplus"  -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3           -- Hide * markup for bold and italic
opt.confirm = true             -- Confirm to save changes before exiting modified buffer
opt.cursorline = false         -- Enable highlighting of the current line
opt.expandtab = true           -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true      -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 3
opt.list = true            -- Show some invisible characters (tabs...
opt.mouse = "a"            -- Enable mouse mode
opt.number = true          -- Print line number
opt.pumblend = 10          -- Popup blend
opt.pumheight = 10         -- Maximum number of entries in a popup
opt.relativenumber = true  -- Relative line numbers
opt.scrolloff = 4          -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true      -- Round indent
opt.shiftwidth = 4         -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false       -- Dont show mode since we have a statusline
opt.sidescrolloff = 8      -- Columns of context
opt.signcolumn = "yes"     -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true       -- Don't ignore case with capitals
opt.smartindent = true     -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true      -- Put new windows below current
opt.splitright = true      -- Put new windows right of current
opt.tabstop = 4            -- Number of spaces tabs count for
opt.termguicolors = true   -- True color support
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 250                        -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full"          -- Command-line completion mode
opt.winminwidth = 5                         -- Minimum window width
opt.wrap = false                            -- Disable line wrap
opt.foldmethod = "expr"                     -- Enable folding based on expression
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use treesitter for folding
opt.foldcolumn = "0"                        -- Disable fold column
opt.foldtext = ""                           -- Disable fold text
opt.foldlevelstart = 99                     -- Start with all folds open
opt.foldnestmax = 4                         -- Maximum fold nesting level
opt.splitkeep = "screen"                    -- Keep screen position on split
opt.shortmess:append({ C = true })          -- Don't show "scanning" messages

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- Disable unused providers to suppress checkhealth warnings
vim.g.loaded_perl_provider = 0

-- Always ensure files end with a newline (linters expect this)
vim.opt.fixendofline = true

vim.diagnostic.config({
    -- Global settings for diagnostics
    virtual_text = {
        spacing = 2, -- Adjust spacing for virtual text
        prefix = "●", -- Set a prefix for virtual text
    },
    signs = true, -- Enable signs in the signcolumn
    underline = true, -- Enable underlines for diagnostics
    update_in_insert = false, -- Disable diagnostic updates in insert mode
    severity_sort = true, -- Sort diagnostics by severity
})

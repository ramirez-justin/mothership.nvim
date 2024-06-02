--Whichkey
local wk = require("which-key")
wk.register({
    t = {
        name = "Compiler/Change",
        o = { "<cmd>CompilerOpen<cr>", "Open Compiler" },
        r = { "<cmd>CompilerStop<cr><cmd>CompilerRedo<cr>", "Redo Last Option" },
        c = { "<cmd>CompilerToggleResults<cr>", "Toggle Results" },
    },
    f = {
        name = "Telescope", -- optional group name
        f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
        b = { "<cmd>Telescope buffers<cr>", "Buffers" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false }, -- additional options for creating the keymap
        g = { "<cmd>Telescope git_files<cr>", "Git Files" },
        s = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    },
    g = {
        name = "Lazygit",
        g =  {"<cmd>LazyGit<cr>", "Open LazyGit", noremap=false },
    },
    e = { ":NvimTreeToggle<cr>", "Toggle NVIM Tree" },
    --["1"] = "which_key_ignore",  -- special label to hide it in the popup
    w = { "<cmd>w<cr>", "Write File" },
    q = { "<cmd>q<cr>", "Quit" },
    h = { "<cmd>noh<cr>", "Remove Highlights" },
    d = "Dashboard",
    a = "Harpoon Add File",
    z = "Undotree",
    r = "Rename",
},
{
    prefix = "<leader>",
    presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
    },
})


--Whichkey
local wk = require("which-key")
wk.add({
    { "<leader>d", desc = "Dashboard" },
    { "<leader>e", ":NvimTreeToggle<cr>", desc = "Toggle NVIM Tree" },
    { "<leader>f", group = "Telescope" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File", remap = true },
    { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>g", group = "Lazygit" },
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open LazyGit", remap = true },
    { "<leader>h", "<cmd>noh<cr>", desc = "Remove Highlights" },
    { "<leader>q", "<cmd>q<cr>", desc = "Quit" },
    { "<leader>r", desc = "Rename" },
    { "<leader>t", group = "Compiler/Change" },
    { "<leader>tc", "<cmd>CompilerToggleResults<cr>", desc = "Toggle Results" },
    { "<leader>to", "<cmd>CompilerOpen<cr>", desc = "Open Compiler" },
    { "<leader>tr", "<cmd>CompilerStop<cr><cmd>CompilerRedo<cr>", desc = "Redo Last Option" },
    { "<leader>w", "<cmd>w<cr>", desc = "Write File" },
    { "<leader>z", desc = "Undotree" },
})

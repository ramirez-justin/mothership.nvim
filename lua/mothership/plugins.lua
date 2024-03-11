-- Comment
require('Comment').setup()



-- Indent Blankspace config
--vim.opt.list = true
--vim.opt.listchars:append "space:⋅"
--vim.opt.listchars:append "eol: "
-- require("ibl").setup ({
--     --for example, context is off by default, use this to turn it on
--     show_current_context = true,
--     show_current_context_start = true,
--    --  exclude = {
--    --      buftypes = {"nofile", "Dashboard"},
--    --      filetypes = {"help", "dashboard"},
--    --      buflisted = true,
--    --      bufname = {},
--    --      bufnr = {},
--    -- },
-- })


--Notify
local nvim_notify = require("notify")
nvim_notify.setup {
    -- Animation style
    stages = "fade_in_slide_out",
    -- Default timeout for notifications
    timeout = 4000,
    background_colour = "#2E3440",
}
vim.notify = nvim_notify


-- Trouble
require("trouble").setup {
    auto_open = false,
    auto_close = true,
    auto_preview = false,
    auto_fold = false,
    use_diagnostic_signs = true,
}
--Keybindings
-- jump to the next item, skipping the groups
require("trouble").next({skip_groups = true, jump = true});
-- jump to the previous item, skipping the groups
require("trouble").previous({skip_groups = true, jump = true});
-- jump to the first item, skipping the groups
require("trouble").first({skip_groups = true, jump = true});
-- jump to the last item, skipping the groups
require("trouble").last({skip_groups = true, jump = true});

-- Noice config
require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})

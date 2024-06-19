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
    timeout = 5000,
    background_colour = "#2E3440",
}
vim.notify = nvim_notify


-- Trouble
require("trouble").setup {
  modes = {
    diagnostics = {
      preview = {
        type = "float",
        relative = "editor",
        border = "rounded",
        title = "Preview",
        title_pos = "center",
        position = { 0, -2 },
        size = { width = 0.3, height = 0.3 },
        zindex = 200,
      },
    },
  },
  action_keys = {
    hover = "K", -- opens a small popup with the full multiline message
  },
  auto_preview = true, -- automatically preview the location of the diagnostic
}

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

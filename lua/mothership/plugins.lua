-- Comment
require('Comment').setup()

-- lualine config
require('lualine').get_config()
require('lualine').setup{
  options = {
    theme = 'auto',
    globalstatus = true,
    sections = {
      lualine_a = {
        {
          'filename',
          file_status = true,      -- Displays file status (readonly status, modified status)
          newfile_status = true,  -- Display new file status (new file means no write after created)
          path = 3,                -- 0: Just the filename
          -- 1: Relative path
          -- 2: Absolute path
          -- 3: Absolute path, with tilde as the home directory
          -- 4: Filename and parent dir, with tilde as the home directory

          shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
          -- for other components. (terrible name, any suggestions?)
          symbols = {
            modified = '[+]',      -- Text to show when the file is modified.
            readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
            unnamed = '[No Name]', -- Text to show for unnamed buffers.
            newfile = '[New]',     -- Text to show for newly created file before first write
          }
        }
      }
    }
  }
}


-- Indent Blankspace config
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol: "
vim.g.indent_blankline_buftype_exclude = "Dashboard"
require("indent_blankline").setup {
  -- for example, context is off by default, use this to turn it on
  show_current_context = true,
  show_current_context_start = true,
}

--Notify
local nvim_notify = require("notify")
nvim_notify.setup {
    -- Animation style
    stages = "fade_in_slide_out",
    -- Default timeout for notifications
    timeout = 5500,
    background_colour = "#2E3440",
}
vim.notify = nvim_notify


-- Wilder
local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})
wilder.set_option('renderer', wilder.popupmenu_renderer({
  highlighter = wilder.basic_highlighter(),
  left = {' ', wilder.popupmenu_devicons()},
  right = {' ', wilder.popupmenu_scrollbar()},
}))

-- Trouble
require("trouble").setup {
    auto_open = false,
    auto_close = true,
    auto_preview = false,
    auto_fold = false,
    use_lsp_diagnostic_signs = true,
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


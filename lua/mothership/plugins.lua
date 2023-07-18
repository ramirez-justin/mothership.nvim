-- pass to setup along with your other options
require("nvim-tree").setup {
  on_attach = my_on_attach,
}


-- Comment
require('Comment').setup()


-- lualine config
require('lualine').get_config()
require('lualine').setup{
  options = { 
    theme = 'dracula',
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
  timeout = 1500,
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

-- -- DBTpal
-- local dbt = require('dbtpal')
-- dbt.setup {
--     -- Path to the dbt executable
--     path_to_dbt = "dbt",
--     -- Path to the dbt project, if blank, will auto-detect
--     -- using currently open buffer for all sql,yml, and md files
--     path_to_dbt_project = "",
--     -- Path to dbt profiles directory
--     path_to_dbt_profiles_dir = vim.fn.expand "~/.dbt",
--     -- Search for ref/source files in macros and models folders
--     extended_path_search = true,
--     -- Prevent modifying sql files in target/(compiled|run) folders
--     protect_compiled_files = truem,
--     vim.keymap.set('n', '<leader>rf', dbt.run),
--     vim.keymap.set('n', '<leader>ra', dbt.run_all),
--     vim.keymap.set('n', '<leader>td', dbt.test),
--     vim.keymap.set('n', '<leader>dm', require('dbtpal.telescope').dbt_picker)
-- }


-- pass to setup along with your other options
require("nvim-tree").setup {
  on_attach = my_on_attach,
}

-- Treesitter config
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "sql", "rust", "python", "json", "java" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI insrequire'nvim-treesitter.configs'.setup {}
  auto_install = true,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}


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

-- Mason
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup()

-- Dashboard
require('dashboard').setup {
  theme = 'hyper', --  theme is doom and hyper default is hyper
  disable_move,    --  default is false disable move keymap for hyper
  shortcut_type,   --  shorcut type 'letter' or 'number'
  change_to_vcs_root, -- default is false,for open file in hyper mru. it will change to the root of vcs
  config = {
    week_header = {
      enable = true,
    },
    shortcut = {
      { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        desc = ' Apps',
        group = 'DiagnosticHint',
        action = 'Telescope app',
        key = 'a',
      },
      {
        desc = ' dotfiles',
        group = 'Number',
        action = 'Telescope dotfiles',
        key = 'd',
      },
    },
    footer = {'MOTHERSHIP'},
  },
}
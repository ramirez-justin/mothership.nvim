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

-- Telescope
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

require("telescope").load_extension("recent_files")


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
  theme = 'doom', --  theme is doom and hyper default is hyper
  disable_move,    --  default is false disable move keymap for hyper
  shortcut_type,   --  shorcut type 'letter' or 'number'
  change_to_vcs_root, -- default is false,for open file in hyper mru. it will change to the root of vcs
  config = {
    header = {
      '',
      'MMMMMMMM               MMMMMMMM     OOOOOOOOO     TTTTTTTTTTTTTTTTTTTTTTTHHHHHHHHH     HHHHHHHHHEEEEEEEEEEEEEEEEEEEEEERRRRRRRRRRRRRRRRR      SSSSSSSSSSSSSSS HHHHHHHHH     HHHHHHHHHIIIIIIIIIIPPPPPPPPPPPPPPPPP   ',
      'M:::::::M             M:::::::M   OO:::::::::OO   T:::::::::::::::::::::TH:::::::H     H:::::::HE::::::::::::::::::::ER::::::::::::::::R   SS:::::::::::::::SH:::::::H     H:::::::HI::::::::IP::::::::::::::::P  ',
      'M::::::::M           M::::::::M OO:::::::::::::OO T:::::::::::::::::::::TH:::::::H     H:::::::HE::::::::::::::::::::ER::::::RRRRRR:::::R S:::::SSSSSS::::::SH:::::::H     H:::::::HI::::::::IP::::::PPPPPP:::::P ',
      'M:::::::::M         M:::::::::MO:::::::OOO:::::::OT:::::TT:::::::TT:::::THH::::::H     H::::::HHEE::::::EEEEEEEEE::::ERR:::::R     R:::::RS:::::S     SSSSSSSHH::::::H     H::::::HHII::::::IIPP:::::P     P:::::P',
      'M::::::::::M       M::::::::::MO::::::O   O::::::OTTTTTT  T:::::T  TTTTTT  H:::::H     H:::::H    E:::::E       EEEEEE  R::::R     R:::::RS:::::S              H:::::H     H:::::H    I::::I    P::::P     P:::::P',
      'M:::::::::::M     M:::::::::::MO:::::O     O:::::O        T:::::T          H:::::H     H:::::H    E:::::E               R::::R     R:::::RS:::::S              H:::::H     H:::::H    I::::I    P::::P     P:::::P',
      'M:::::::M::::M   M::::M:::::::MO:::::O     O:::::O        T:::::T          H::::::HHHHH::::::H    E::::::EEEEEEEEEE     R::::RRRRRR:::::R  S::::SSSS           H::::::HHHHH::::::H    I::::I    P::::PPPPPP:::::P ',
      'M::::::M M::::M M::::M M::::::MO:::::O     O:::::O        T:::::T          H:::::::::::::::::H    E:::::::::::::::E     R:::::::::::::RR    SS::::::SSSSS      H:::::::::::::::::H    I::::I    P:::::::::::::PP  ',
      'M::::::M  M::::M::::M  M::::::MO:::::O     O:::::O        T:::::T          H:::::::::::::::::H    E:::::::::::::::E     R::::RRRRRR:::::R     SSS::::::::SS    H:::::::::::::::::H    I::::I    P::::PPPPPPPPP    ',
      'M::::::M   M:::::::M   M::::::MO:::::O     O:::::O        T:::::T          H::::::HHHHH::::::H    E::::::EEEEEEEEEE     R::::R     R:::::R       SSSSSS::::S   H::::::HHHHH::::::H    I::::I    P::::P            ',
      'M::::::M    M:::::M    M::::::MO:::::O     O:::::O        T:::::T          H:::::H     H:::::H    E:::::E               R::::R     R:::::R            S:::::S  H:::::H     H:::::H    I::::I    P::::P            ',
      'M::::::M     MMMMM     M::::::MO::::::O   O::::::O        T:::::T          H:::::H     H:::::H    E:::::E       EEEEEE  R::::R     R:::::R            S:::::S  H:::::H     H:::::H    I::::I    P::::P            ',
      'M::::::M               M::::::MO:::::::OOO:::::::O      TT:::::::TT      HH::::::H     H::::::HHEE::::::EEEEEEEE:::::ERR:::::R     R:::::RSSSSSSS     S:::::SHH::::::H     H::::::HHII::::::IIPP::::::PP          ',
      'M::::::M               M::::::M OO:::::::::::::OO       T:::::::::T      H:::::::H     H:::::::HE::::::::::::::::::::ER::::::R     R:::::RS::::::SSSSSS:::::SH:::::::H     H:::::::HI::::::::IP::::::::P          ',
      'M::::::M               M::::::M   OO:::::::::OO         T:::::::::T      H:::::::H     H:::::::HE::::::::::::::::::::ER::::::R     R:::::RS:::::::::::::::SS H:::::::H     H:::::::HI::::::::IP::::::::P          ',
      'MMMMMMMM               MMMMMMMM     OOOOOOOOO           TTTTTTTTTTT      HHHHHHHHH     HHHHHHHHHEEEEEEEEEEEEEEEEEEEEEERRRRRRRR     RRRRRRR SSSSSSSSSSSSSSS   HHHHHHHHH     HHHHHHHHHIIIIIIIIIIPPPPPPPPPP          ',
      '',                                                                                                                                                                                                                  
      '',                                                                                                                                                                                                                  
      '',                                                                                                                                                                                                                  
      '',                                                                                                                                                                                                                  
      '',                                                                                                                                                                                                                  
    },
    center = {
      { 
        icon = " 󰈞 ",
        desc = "Find  File                              ",
        action = "Telescope find_files",
        key = "f",
      },
      {
        icon = "  ",
        desc = "Recently opened files                   ",
        action = "lua require('telescope').extensions.recent_files.pick()",
        key = "r",
      },
      {
        icon = " 󱠿 ",
        desc = "Project grep                            ",
      action = "Telescope live_grep",
        key = "g",
      },
      {
        icon = "  ",
        desc = "Open Nvim config                        ",
        action = "tabnew $MYVIMRC | tcd %:p:h",
        key = "c",
      },
      {
        icon = " 󰎔 ",
        desc = "New file                                ",
        action = "enew",
        key = "e",
      },
      {
        icon = " 󰩈 ",
        desc = "Quit Nvim                               ",
        action = "quit",
        key = "q",
      },
      { 
        icon = " 󰊳  ", 
        desc = "Update                               ", 
        action = "Lazy update", 
        key = "u" },
    },
    
  },
}

  --toggleterm
  require("toggleterm").setup{}


-- Dashboard
require('dashboard').setup {
    theme = 'doom', --  theme is doom and hyper default is hyper
    disable_move = false,    --  default is false disable move keymap for hyper
    shortcut_type = 'letter',   --  shorcut type 'letter' or 'number'
    config = {
        header = {
'',
'',
'███╗   ███╗ ██████╗ ████████╗██╗  ██╗███████╗██████╗ ███████╗██╗  ██╗██╗██████╗ ',
'████╗ ████║██╔═══██╗╚══██╔══╝██║  ██║██╔════╝██╔══██╗██╔════╝██║  ██║██║██╔══██╗',
'██╔████╔██║██║   ██║   ██║   ███████║█████╗  ██████╔╝███████╗███████║██║██████╔╝',
'██║╚██╔╝██║██║   ██║   ██║   ██╔══██║██╔══╝  ██╔══██╗╚════██║██╔══██║██║██╔═══╝ ',
'██║ ╚═╝ ██║╚██████╔╝   ██║   ██║  ██║███████╗██║  ██║███████║██║  ██║██║██║     ',
'╚═╝     ╚═╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝     ',
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
                key = "u"
            },
        },
        footer = {
            "",
            "The Universe is under no obligation to make sense to you",
            "               - Neil deGrasse Tyson -                  ",
        }
    },
}

local colors = require "material.colors"



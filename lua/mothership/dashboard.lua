-- Dashboard
require('dashboard').setup {
    theme = 'doom', --  theme is doom and hyper default is hyper
    disable_move = false,    --  default is false disable move keymap for hyper
    shortcut_type = 'letter',   --  shorcut type 'letter' or 'number'
    config = {
        header = {
'',
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
            position = 'center', -- center, left or right
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


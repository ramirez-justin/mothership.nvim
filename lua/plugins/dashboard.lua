return {
    -- <https://guithub.com/glepnir/dashboard-nvim>
    {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
        },
        opts = function()
            local quotes = {
                [1] = {
                    "",
                    "The Universe is under no obligation to make sense to you",
                    "               - Neil deGrasse Tyson -                  ",
                },
                [2] = {
                    "",
                    "The universe is a pretty big place. If it's just us, seems like an awful waste of space.",
                    "                                     - Carl Sagan -                                     ",
                },
                [3] = {
                    "",
                    "The nitrogen in our DNA, the calcium in our teeth, the iron in our blood, the carbon in",
                    "our apple pies were made in the interiors of collapsing stars. We are made of starstuff.",
                    "                                     - Carl Sagan -                                     ",
                },
                [4] = {
                    "",
                    "I don’t think the human race will survive the next thousand years unless we spread into",
                    " space. There are too many accidents that can befall life on a single planet. But I’m an",
                    "                      optimist. We will reach out to the stars.                         ",
                    "                                - Stephen Hawking -                                     ",
                },
                [5] = {
                    "",
                    "The greatest enemy of knowledge is not ignorance, it is the illusion of knowledge.",
                    "                                - Stephen Hawking -                                     ",
                },
                [6] = {
                    "",
                    "The universe doesn’t allow perfection.",
                    "                                - Stephen Hawking -                                     ",
                },
                [7] = {
                    "",
                    "I have noticed even people who claim everything is predestined, and that we can do",
                    " nothing to change it, look before they cross the road.",
                    "                                - Stephen Hawking -                                     ",
                },
                [8] = {
                    "",
                    "The past, like the future, is indefinite and exists only as a spectrum of possibilities.",
                    "                                - Stephen Hawking -                                     ",
                },
                [9] = {
                    "",
                    "I have no special talent. I am only passionately curious.",
                    "                                - Albert Einstein -                                     ",
                },
                [10] = {
                    "",
                    "The important thing is not to stop questioning. Curiosity has its own reason for existing.",
                    "                                - Albert Einstein -                                     ",
                },
                [11] = {
                    "",
                    "The true sign of intelligence is not knowledge but imagination.",
                    "                                - Albert Einstein -                                     ",
                },
                [12] = {
                    "",
                    "The most beautiful thing we can experience is the mysterious. It is the source of all",
                    "                            true art and science.                                    ",
                    "                            - Albert Einstein -                                      ",
                },
                [13] = {
                    "",
                    "The difference between stupidity and genius is that genius has its limits.",
                    "                         - Albert Einstein -                               ",
                },
                [14] = {
                    "",
                    "The only thing that interferes with my learning is my education.",
                    "                      - Albert Einstein -                                ",
                },
                [15] = {
                    "",
                    "If you can't explain it to a six year old, you don't understand it yourself.",
                    "                           - Albert Einstein -                              ",
                },
                [16] = {
                    "",
                    "I am enough of an artist to draw freely upon my imagination. Imagination is more",
                    "important than knowledge. Knowledge is limited. Imagination encircles the world.",
                    "                                - Albert Einstein -                                     ",
                },
                [17] = {
                    "",
                    "I’m sure the universe is full of intelligent life. It’s just been too intelligent to come here.",
                    "                                - Arthur C. Clarke -                                     ",
                },
            }
            -- function to slelect footer that is random daily quote pulled from a list
            local function daily_quote()
                local choice = math.random(1, 17)
                return quotes[choice]
            end

            return {
                theme = "doom", --  theme is doom and hyper default is hyper
                disable_move = false, --  default is false disable move keymap for hyper
                shortcut_type = "letter", --  shorcut type 'letter' or 'number'
                config = {
                    --TODO: Try this
                    -- local header = {
                    --     { "███╗   ███╗ ██████╗ ████████╗██╗  ██╗███████╗██████╗ ███████╗██╗  ██╗██╗██████╗ ", "Title" },
                    --     { "████╗ ████║██╔═══██╗╚══██╔══╝██║  ██║██╔════╝██╔══██╗██╔════╝██║  ██║██║██╔══██╗", "Keyword" },
                    --     { "██╔████╔██║██║   ██║   ██║   ███████║█████╗  ██████╔╝███████╗███████║██║██████╔╝", "Function" },
                    --     { "██║╚██╔╝██║██║   ██║   ██║   ██╔══██║██╔══╝  ██╔══██╗╚════██║██╔══██║██║██╔═══╝ ", "Constant" },
                    --     { "██║ ╚═╝ ██║╚██████╔╝   ██║   ██║  ██║███████╗██║  ██║███████║██║  ██║██║██║     ", "String" },
                    --     { "╚═╝     ╚═╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝     ", "Comment" },
                    -- }
                    --
                    -- -- In your dashboard setup
                    -- header = vim.tbl_map(function(line)
                    --     return { line[1], highlight = line[2] }
                    -- end, header)
                    header = {
                        "",
                        "",
                        "",
                        "",
                        "",
                        "███╗   ███╗ ██████╗ ████████╗██╗  ██╗███████╗██████╗ ███████╗██╗  ██╗██╗██████╗ ",
                        "████╗ ████║██╔═══██╗╚══██╔══╝██║  ██║██╔════╝██╔══██╗██╔════╝██║  ██║██║██╔══██╗",
                        "██╔████╔██║██║   ██║   ██║   ███████║█████╗  ██████╔╝███████╗███████║██║██████╔╝",
                        "██║╚██╔╝██║██║   ██║   ██║   ██╔══██║██╔══╝  ██╔══██╗╚════██║██╔══██║██║██╔═══╝ ",
                        "██║ ╚═╝ ██║╚██████╔╝   ██║   ██║  ██║███████╗██║  ██║███████║██║  ██║██║██║     ",
                        "╚═╝     ╚═╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝     ",
                        "",
                        "",
                        "",
                        "",
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
                            key = "m",
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
                            key = "u",
                        },
                    },
                    footer = daily_quote(),
                },
            }
        end,
    },
}

return {
    {
        "akinsho/toggleterm.nvim",
        opts = function()
            return {
                size = 20,
                open_mapping = [[<C-\>]],
                hide_numbers = true, -- hide the number column in toggleterm buffers
                shade_filetypes = {},
                autochdir = true, -- synchronize terminal directory with Neovim
                shade_terminals = true, -- apply shading to terminals
                shading_factor = 2, -- percentage by which to lighten terminal background
                start_in_insert = true,
                insert_mappings = true, -- enable open mapping in insert mode
                terminal_mappings = true, -- enable open mapping in terminal mode
                persist_size = true,
                persist_mode = true, -- remember the previous terminal mode
                direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
                close_on_exit = true, -- close terminal when process exits
                shell = vim.o.shell, -- default shell
                auto_scroll = true, -- scroll to the bottom on output
                float_opts = {
                    border = "curved", -- 'single' | 'double' | 'shadow' | 'curved'
                    winblend = 0,
                    highlights = {
                        border = "Normal",
                        background = "Normal",
                    },
                },
                winbar = {
                    enabled = false,
                },
            }
        end,
        config = function(_, opts)
            require("toggleterm").setup(opts)
        end,
        keys = {
            { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
        },
    },
}

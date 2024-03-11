--toggleterm
local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup({
    -- size can be a number or function which is passed the current terminal
    size = 20,
    open_mapping = [[<C-\>]],
    -- on_create = fun(t: Terminal), -- function to run when the terminal is first created
    -- on_open = fun(t: Terminal), -- function to run when the terminal opens
    -- on_close = fun(t: Terminal), -- function to run when the terminal closes
    -- on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
    -- on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
    -- on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
    shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
    shading_factor = 2, -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    persist_size = true,
    persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
    direction = 'float',
    close_on_exit = true, -- close the terminal window when the process exits
    -- Change the default shell. Can be a string or a function returning a string
    shell = vim.o.shell,
    auto_scroll = true, -- automatically scroll to the bottom on terminal output
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = 'curved',
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
    winbar = {
        enabled = false,
    }
})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end


local Terminal = require('toggleterm.terminal').Terminal
local spotify_tui = Terminal:new({
  cmd = "spt", -- Command to execute (spotify-tui)
  direction = "float", -- Terminal layout (float, horizontal, vertical)
  dir = "~/", -- Start in the git repository directory, or use your preferred start directory
  close_on_exit = true, -- Close the terminal window when spt exits
})
local gh_dash = Terminal:new({
  cmd = "gh dash", -- Command to execute (gh)
  direction = "float", -- Terminal layout (float, horizontal, vertical)
  dir = "~/", -- Start in the git repository directory, or use your preferred start directory
  close_on_exit = true, -- Close the terminal window when gh exits
})


-- Function to toggle the spotify-tui terminal
function _toggle_spotify_tui()
  spotify_tui:toggle()
end


-- Function to toggle GH Dash
function _toggle_gh_dash()
  gh_dash:toggle()
end


-- Keymap to toggle spotify-tui
vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>lua _toggle_spotify_tui()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>gb", "<cmd>lua _toggle_gh_dash()<CR>", {noremap = true, silent = true})

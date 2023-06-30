# A Neovim configuration repo to space out with

Install the LazyVim Starter
Make a backup of your current Neovim files:

    # required
    mv ~/.config/nvim ~/.config/nvim.bak

    # optional but recommended
    mv ~/.local/share/nvim ~/.local/share/nvim.bak
    mv ~/.local/state/nvim ~/.local/state/nvim.bak
    mv ~/.cache/nvim ~/.cache/nvim.bak

Clone the starter

    git clone https://github.com/ramirez-justin/mothership.nvim ~/.config/nvim

Start Neovim!

    nvim

Refer to the comments in the files on how to customize LazyVim.






-- Insert the following into your ~/.config/nvim/init.lua

local beammeup = vim.fn.stdpath("data") .. "/mothership/mothership.nvim"
if not vim.loop.fs_stat(beammeup) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/ramirez-justin/mothership.nvim",
    "--branch=stable", -- latest stable release
    beammeup,
  })
end
vim.opt.rtp:prepend(beammeup)

require("mothership")



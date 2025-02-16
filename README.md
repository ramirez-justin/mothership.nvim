

# A Neovim configuration repo to space out with
prereqs:
- deno
- lazygit
- pyenv(+setup virtual-env)
- [Go](https://go.dev/doc/install)
- [Cargo](https://doc.rust-lang.org/cargo/getting-started/installation.html)
- [Lua](https://www.lua.org/download.html)
- [luarocks](https://luarocks.org/)
- [ruby](https://www.ruby-lang.org/en/documentation/installation/)
- composer
- php
- npm
- node
- [Julia](https://julialang.org/downloads/)
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

Run command
```
:checkhealth
```

Refer to the comments in the files on how to customize LazyVim.

setup buffer for sptify-tui:
  requires spotify-tui: https://github.com/Rigellute/spotify-tui
  requires spotifyd: https://github.com/Spotifyd/spotifyd


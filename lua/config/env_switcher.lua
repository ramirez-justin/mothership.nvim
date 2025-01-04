local function set_python_host()
    local filepath = vim.fn.expand("%:p")
    local pyenv_root = os.getenv("PYENV_ROOT") -- Get the PYENV_ROOT environment variable

    if pyenv_root == nil then
        print("PYENV_ROOT is not set. Falling back to default Python paths.")
        return
    end

    if string.match(filepath, "/Users/justin/gametime/gametime%-data/airflow/.*") then
        -- Path to the Python executable in dbt_local virtual environment
        vim.g.python3_host_prog = pyenv_root .. "/versions/dbt_local/bin/python"
    else
        -- Path to the Python executable in neovim-python3 virtual environment
        vim.g.python3_host_prog = pyenv_root .. "/versions/nvim_python3/bin/python"
    end
end

-- Run `set_python_host` function when Neovim opens a file
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", callback = set_python_host })

-- Set the virtual environment for python3
vim.g.python3_host_prog = os.getenv("PYENV_ROOT") .. "/versions/nvim_python3/bin/python"

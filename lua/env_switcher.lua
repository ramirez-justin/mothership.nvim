local function set_python_host()
    local filepath = vim.fn.expand('%:p')
    if string.match(filepath, '/Users/justin/gametime/gametime%-data/airflow/.*') then
        -- Path to the Python executable in dbt_local virtual environment
        vim.g.python3_host_prog = '/Users/justin/.pyenv/versions/dbt_local/bin/python'
    else
        -- Path to the Python executable in neovim-python3 virtual environment
        vim.g.python3_host_prog = '/Users/justin/.pyenv/versions/nvim_python3/bin/python'
    end
end

-- Run `set_python_host` function when Neovim opens a file
vim.api.nvim_create_autocmd("BufEnter", {pattern = "*", callback = set_python_host})

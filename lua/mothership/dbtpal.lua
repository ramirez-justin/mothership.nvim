-- DBTpal
local dbt = require('dbtpal')
dbt.setup {
    -- Path to the dbt executable
    path_to_dbt = "dbt",
    -- Path to the dbt project, if blank, will auto-detect
    -- using currently open buffer for all sql,yml, and md files
    path_to_dbt_project = "",
    -- Path to dbt profiles directory
    path_to_dbt_profiles_dir = vim.fn.expand "~/.dbt",
    -- Search for ref/source files in macros and models folders
    extended_path_search = true,
    -- Prevent modifying sql files in target/(compiled|run) folders
    protect_compiled_files = true,
    vim.keymap.set('n', '<leader>tr', dbt.run),
    vim.keymap.set('n', '<leader>ta', dbt.run_all),
    vim.keymap.set('n', '<leader>tt', dbt.test),
    vim.keymap.set('n', '<leader>tp', require('dbtpal.telescope').dbt_picker)
}


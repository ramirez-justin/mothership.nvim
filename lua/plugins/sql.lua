return {
    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = {
            { "tpope/vim-dadbod",                     lazy = true },
            { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
            {
                "ellisonleao/dotenv.nvim",
                config = function()
                    require("dotenv").setup({
                        enable_on_load = true, -- Automatically load .env on startup
                    })
                end,
            },
        },
        cmd = {
            "DBUI",
            "DBUIToggle",
            "DBUIAddConnection",
            "DBUIFindBuffer",
        },
        -- TODO: Troubl shoot this
        -- config = function()
        --     -- Helper function to load a .env file from the current root directory
        --     local function load_env_file()
        --         local env_file = vim.fn.getcwd() .. "/.env"
        --         local file = io.open(env_file, "r")
        --         if not file then
        --             return
        --         end
        --
        --         for line in file:lines() do
        --             local key, value = line:match("(%w+)%s*=%s*(.+)")
        --             if key and value then
        --                 vim.fn.setenv(key, value) -- Set environment variables
        --             end
        --         end
        --         file:close()
        --     end
        --
        --     -- Load the .env file
        --     load_env_file()
        --
        --     -- Configure vim-dadbod-ui with environment variables
        --     vim.g.db_ui_use_nerd_fonts = 1
        --     vim.g.db_url = "snowflake://"
        --         .. os.getenv("SNOWFLAKE_USER")
        --         .. ":"
        --         .. os.getenv("SNOWFLAKE_PASSWORD")
        --         .. "@"
        --         .. os.getenv("SNOWFLAKE_ACCOUNT")
        --         .. "/"
        --         .. os.getenv("SNOWFLAKE_DATABASE")
        -- end,
    },
    -- maybe this: https://github.com/Xemptuous/sqlua.nvim
}

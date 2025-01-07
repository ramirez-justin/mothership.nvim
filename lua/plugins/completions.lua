-- <https://gihub.com/hrsh7th/nvim-cmp>
return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp", -- Autocompletion plugin
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-calc",       -- Calculator source for nvim-cmp
        "hrsh7th/cmp-emoji",      -- Emoji source for nvim-cmp
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets", --Snippets source for nvim cmp
        "saadparwaiz1/cmp_luasnip",
        "zbirenbaum/copilot.lua",
        "zbirenbaum/copilot-cmp",
        "windwp/nvim-autopairs",
    },
    opts = function(_, opts)
        -- Set up nvim-cmp
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local autopairs = require("nvim-autopairs")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local ts_conds = require("nvim-autopairs.ts-conds")

        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        local check_back_space = function()
            local col = vim.fn.col(".") - 1
            return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
        end

        -- TODO: These should probably move somewhere to be used globally
        --   פּ ﯟ   some other good icons
        local kind_icons = {
            Text = "󰊄",
            Method = "m",
            Function = "󰊕",
            Constructor = "",
            Field = "",
            Variable = "󰫧",
            Class = "",
            Interface = "",
            Module = "",
            Property = "",
            Unit = "",
            Value = "",
            Enum = "",
            Keyword = "󰌆",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = "󰉺",
            Copilot = "",
        }
        -- find more here: https://www.nerdfonts.com/cheat-sheet

        vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

        -- CMP Options
        opts.snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                luasnip.lsp_expand(args.body) -- For `luasnip` users.
                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            end,
        }
        opts.window = {
            -- completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        }
        opts.mapping = cmp.mapping.preset.insert({
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            ["<C-j>"] = cmp.mapping.select_next_item(),
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expandable() then
                    luasnip.expand()
                    -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                    -- that way you will only jump inside the snippet region
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                elseif check_back_space then
                    fallback()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
        })
        opts.formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
                -- fancy icons and a name of kind
                vim_item.kind = kind_icons[vim_item.kind]
                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    luasnip = "[LuaSnip]",
                    calc = "[Calc]",
                    buffer = "[Buffer]",
                    path = "[Path]",
                    emoji = "[Emoji]",
                })[entry.source.name]
                return vim_item
            end,
        }
        -- TODO: ensure all sources are listed here
        opts.sources = {
            { name = "copilot" },
            { name = "render-markdown" },
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
            { name = "cmdline" },
        }

        -- CMP Command-Line Sources
        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
        })

        -- Autopairs Integration
        autopairs.setup({
            check_ts = true,
            ts_config = {
                lua = { "string" },
                javascript = { "template_string" },
                java = false,
            },
        })
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

        -- Custom Pair Rules
        autopairs.add_rules({
            autopairs.rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({ "string", "comment" })),
            autopairs.rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({ "function" })),
        })
    end,
    config = function(_, opts)
        require("cmp").setup(opts)
        require("copilot").setup({
            suggestion = { enabled = false },
            panel = { enabled = false },
        })
        require("copilot_cmp").setup()
    end,
}

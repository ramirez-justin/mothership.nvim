-- Set up nvim-cmp.
local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


local cmp = require('cmp')
local luasnip = require("luasnip")


require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
                -- they way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
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
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})


-- Autopairs
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- cmp.event:on(
--   'confirm_done',
--   cmp_autopairs.on_confirm_done()
-- )
--
-- local Rule = require('nvim-autopairs.rule')
-- local npairs = require('nvim-autopairs')
--
-- npairs.add_rule(Rule("$$","$$","tex"))
--
-- -- you can use some built-in conditions
--
-- local cond = require('nvim-autopairs.conds')
-- print(vim.inspect(cond))

-- npairs.add_rules({
    --   Rule("$", "$",{"tex", "latex"})
    --     -- don't add a pair if the next character is %
    --     :with_pair(cond.not_after_regex("%%"))
    --     -- don't add a pair if  the previous character is xxx
    --     :with_pair(cond.not_before_regex("xxx", 3))
    --     -- don't move right when repeat character
    --     :with_move(cond.none())
    --     -- don't delete if the next character is xx
    --     :with_del(cond.not_after_regex("xx"))
    --     -- disable adding a newline when you press <cr>
    --     :with_cr(cond.none())
    --   },
    --   -- disable for .vim files, but it work for another filetypes
    --   Rule("a","a","-vim")
    -- )
    --
    -- npairs.add_rules({
        --   Rule("$$","$$","tex")
        --     :with_pair(function(opts)
            --         print(vim.inspect(opts))
            --         if opts.line=="aa $$" then
            --         -- don't add pair on that line
            --           return false
            --         end
            --     end)
            --    }
            -- )
            --
            -- -- you can use regex
            -- -- press u1234 => u1234number
            -- npairs.add_rules({
                --     Rule("u%d%d%d%d$", "number", "lua")
                --       :use_regex(true)
                -- })
                --
                --
                --
                -- -- press x1234 => x12341234
                -- npairs.add_rules({
                    --     Rule("x%d%d%d%d$", "number", "lua")
                    --       :use_regex(true)
                    --       :replace_endpair(function(opts)
                        --           -- print(vim.inspect(opts))
                        --           return opts.prev_char:sub(#opts.prev_char - 3,#opts.prev_char)
                        --       end)
                        -- })
                        --
                        --
                        -- -- you can do anything with regex +special key
                        -- -- example press tab to uppercase text:
                        -- -- press b1234s<tab> => B1234S1234S
                        --
                        -- npairs.add_rules({
                            --   Rule("b%d%d%d%d%w$", "", "vim")
                            --     :use_regex(true,"<tab>")
                            --     :replace_endpair(function(opts)
                                --           return
                                --               opts.prev_char:sub(#opts.prev_char - 4,#opts.prev_char)
                                --               .."<esc>viwU"
                                --     end)
                                -- })
                                --
                                -- -- you can exclude filetypes
                                -- npairs.add_rule(
                                --   Rule("$$","$$")
                                --     :with_pair(cond.not_filetypes({"lua"}))
                                -- )
                                -- --- check ./lua/nvim-autopairs/rules/basic.lua

                                require('nvim-autopairs').setup({
                                    enable_check_bracket_line = false,
                                    ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
                                })
                                require('nvim-autopairs').clear_rules()

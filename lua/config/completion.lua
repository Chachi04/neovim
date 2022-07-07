local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local snippy = require("snippy")

local cmp = require("cmp")
cmp.setup(
    {
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                require("snippy").expand_snippet(args.body) -- For `snippy` users.
            end
        },
        window = {},
        mapping = {
            ["<C-n>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
            ["<C-p>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
            ["<Down>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
            ["<Up>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
            ["<C-j>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
            ["<C-k>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-u>"] = cmp.mapping.scroll_docs(4),
            -- ["<tab>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "s"}),
            -- ["<s-tab>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
            ["<CR>"] = cmp.mapping(
                function(fallback)
                    if snippy.can_expand_or_advance() then
                        snippy.expand_or_advance()
                    else
                        fallback()
                    end
                end
            ),
            ["<tab>"] = cmp.mapping(
                function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif snippy.can_expand_or_advance() then
                        snippy.expand_or_advance()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end,
                {"i", "s"}
            ),
            ["<s-tab>"] = cmp.mapping(
                function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif snippy.can_jump(-1) then
                        snippy.previous()
                    else
                        fallback()
                    end
                end,
                {"i", "s"}
            )

            -- ["<CR>"] = cmp.mapping(function(fallback)
            --         if cmp.visible() then
            --             cmp.select_next_item()
            --         elseif snippy.can
            --         end
            --         )
            -- ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
            -- ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
            -- --            ["<Tab>"] = cmp.mapping.select_next_item({ cmp.SelectBehavior.{Insert,Select} }),
            -- --            ["<S-Tab>"] = cmp.mapping.select_prev_item({ cmp.SelectBehavior.{Insert,Select} }),
            -- ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"})
            -- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            -- ["<C-c>"] = cmp.mapping(
            --     {
            --         i = cmp.mapping.abort(),
            --         c = cmp.mapping.close()
            --     }
            -- ),
            -- ["<CR>"] = cmp.mapping.confirm({select = true})
        },
        sources = cmp.config.sources(
            {
                {name = "nvim_lsp"},
                -- {name = "vsnip"},
                {name = "snippy"},
                {name = "buffer"},
                {name = "path"},
                {name = "spell"}
                -- {name = "cmdline"}
            }
        ),
        sorting = {
            comparators = {
                cmp.config.compare.offset,
                cmp.config.compare.exact,
                cmp.config.compare.score,
                require "cmp-under-comparator".under,
                cmp.config.compare.kind,
                cmp.config.compare.sort_text,
                cmp.config.compare.length,
                cmp.config.compare.order
            }
        }
    }
)

-- require("snippy").setup(
--     {
--         mappings = {
--             is = {
--                 ["<Tab>"] = "expand_or_advance",
--                 ["<S-Tab>"] = "previous"
--             }
--         }
--     }
-- )

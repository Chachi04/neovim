local snippy = require("snippy")

local cmp = require("cmp")

local function complete_forward(fallback)
    if snippy.can_expand_or_advance() then
        snippy.expand_or_advance()
    elseif cmp.visible() then
        cmp.select_next_item()
    else
        fallback()
    end
end

local function complete_backward(fallback)
    if snippy.can_jump(-1) then
        snippy.previous()
    elseif cmp.visible() then
        cmp.select_prev_item()
    else
        fallback()
    end
end

cmp.setup(
    {
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                require("snippy").expand_snippet(args.body) -- For `snippy` users.
            end
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered()
        },
        mapping = cmp.mapping.preset.insert(
            {
                -- default
                -- ["<C-n>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
                -- ["<C-p>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
                ["<Down>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
                ["<Up>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
                ["<C-j>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
                ["<C-k>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-u>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({select = true}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<tab>"] = cmp.mapping(complete_forward, {"i", "s"}),
                ["<s-tab>"] = cmp.mapping(complete_backward, {"i", "s"})
            }
        ),
        sources = cmp.config.sources(
            {
                {name = "nvim_lsp"},
                {name = "snippy"},
                {name = "buffer"},
                {name = "path"},
                {name = "dap"},
                {name = "spell"}
                -- {name = "vsnip"},
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

require("snippy").setup(
    {
        mappings = {
            is = {
                ["<Tab>"] = "expand_or_advance",
                ["<S-Tab>"] = "previous"
            }
        }
    }
)

-- local has_words_before = function()
--     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--     return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

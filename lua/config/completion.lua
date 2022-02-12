local cmp = require "cmp"

cmp.setup(
    {
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            end
        },
        mapping = {
            ["<C-n>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
            ["<C-p>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
            ["<Down>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
            ["<Up>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
            ["<tab>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
            ["<s-tab>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm(
                {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true
                }
            )
            -- ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
            -- ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
            -- --            ["<Tab>"] = cmp.mapping.select_next_item({ cmp.SelectBehavior.{Insert,Select} }),
            -- --            ["<S-Tab>"] = cmp.mapping.select_prev_item({ cmp.SelectBehavior.{Insert,Select} }),
            -- ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
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
                {name = "vsnip"},
                {name = "buffer"},
                -- {name = "path"},
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

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
    "/",
    {
        sources = {
            {name = "buffer"}
        }
    }
)

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
    ":",
    {
        sources = cmp.config.sources(
            {
                {name = "path"}
            },
            {
                {name = "cmdline"}
            }
        )
    }
)

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- local servers = {
--     "ltex",
--     "yamlls",
--     "vuels",
--     "pyright",
--     "diagnosticls",
--     "intelephense",
--     "tsserver",
--     "vimls",
--     "jsonls",
--     "cssls",
--     "html",
--     "eslint",
--     "rust_analyzer",
--     "bashls",
--     "tailwindcss",
--     "emmet_ls"
-- }
-- for _, server in pairs(servers) do
--     require("lspconfig")[server].setup {
--         capabilities = capabilities
--     }
-- end

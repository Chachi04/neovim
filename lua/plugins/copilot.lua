-- Copilot
return {
    { import = "astrocommunity.completion.copilot-lua" },
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "zbirenbaum/copilot.lua" },
        opts = function(_, opts)
            local cmp, copilot = require "cmp", require "copilot.suggestion"
            local snip_status_ok, luasnip = pcall(require, "luasnip")
            if not snip_status_ok then return end
            local function has_words_before()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0
                    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
            end
            if not opts.mapping then opts.mapping = {} end
            opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
                if copilot.is_visible() then
                    copilot.accept()
                elseif cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" })

            opts.mapping["<C-j>"] = cmp.mapping(function(fallback)
                if copilot.is_visible() then
                    copilot.next()
                else
                    fallback()
                end
            end)

            opts.mapping["<C-k>"] = cmp.mapping(function(fallback)
                if copilot.is_visible() then
                    copilot.prev()
                else
                    fallback()
                end
            end)

            opts.mapping["<C-right>"] = cmp.mapping(function(fallback)
                if copilot.is_visible() then
                    copilot.accept_word()
                else
                    fallback()
                end
            end)

            opts.mapping["<C-l>"] = cmp.mapping(function(fallback)
                if copilot.is_visible() then
                    copilot.accept_word()
                else
                    fallback()
                end
            end)

            opts.mapping["<C-down>"] = cmp.mapping(function(fallback)
                if copilot.is_visible() then
                    copilot.accept_line()
                else
                    fallback()
                end
            end)

            opts.mapping["<C-j>"] = cmp.mapping(function(fallback)
                if copilot.is_visible() then
                    copilot.accept_line()
                else
                    fallback()
                end
            end)

            opts.mapping["<C-h>"] = cmp.mapping(function(fallback)
                if copilot.is_visible() then
                    copilot.dismiss()
                elseif cmp.visible() then
                    cmp.close()
                else
                    fallback()
                end
            end)

            opts.mapping["<C-c>"] = nil

            return opts
        end,
    },
    -- { import = "astrocommunity.completion.copilot-lua" },
    -- {
    --     -- further customize the options set by the community
    --     "copilot.lua",
    --     opts = {
    --         suggestion = {
    --             keymap = {
    --                 accept = "<C-l>",
    --                 accept_word = false,
    --                 accept_line = false,
    --                 next = "<C-.>",
    --                 prev = "<C-,>",
    --                 dismiss = "<C-]>",
    --             },
    --             enabled = true,
    --         },
    --         panel = {
    --             enabled = true,
    --         },
    --     },
    -- },
    -- { import = "astrocommunity.completion.copilot-lua-cmp" },
    -- {
    --     "zbirenbaum/copilot-cmp",
    --     config = function() require("copilot_cmp").setup() end,
    -- },
    -- {
    --     "hrsh7th/nvim-cmp",
    --     opts = function(_, opts)
    --         local cmp = require "cmp"
    --         opts.mapping["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }
    --         opts.mapping["<C-c>"] = nil
    --         opts.sources = {
    --             { name = "nvim_lsp" },
    --             { name = "luasnip" },
    --             { name = "nvim_lua" },
    --             --     { name = "path" },
    --             --     { name = "copilot" },
    --         }
    --         return opts
    --     end,
    -- },
}

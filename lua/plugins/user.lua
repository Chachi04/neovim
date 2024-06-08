-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

    -- == Examples of Adding Plugins ==

    "andweeb/presence.nvim",
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require("lsp_signature").setup() end,
    },

    -- == Examples of Overriding Plugins ==

    -- customize alpha options
    {
        "goolord/alpha-nvim",
        opts = function(_, opts)
            -- customize the dashboard header
            opts.section.header.val = {
                -- " █████  ███████ ████████ ██████   ██████",
                -- "██   ██ ██         ██    ██   ██ ██    ██",
                -- "███████ ███████    ██    ██████  ██    ██",
                -- "██   ██      ██    ██    ██   ██ ██    ██",
                -- "██   ██ ███████    ██    ██   ██  ██████",
                -- " ",
                -- "    ███    ██ ██    ██ ██ ███    ███",
                -- "    ████   ██ ██    ██ ██ ████  ████",
                -- "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
                -- "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
                -- "    ██   ████   ████   ██ ██      ██",
                "",
                "",
                "",
                "",
                "",
                "███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗",
                "████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║",
                "██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║",
                "██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║",
                "██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║",
                "╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝",
            }
            return opts
        end,
    },

    -- You can disable default plugins as follows:
    { "max397574/better-escape.nvim", enabled = false },

    -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
    {
        "L3MON4D3/LuaSnip",
        config = function(plugin, opts)
            require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
            -- add more custom luasnip configuration such as filetype extend or custom snippets
            local luasnip = require "luasnip"
            luasnip.filetype_extend("javascript", { "javascriptreact" })
        end,
    },

    {
        "windwp/nvim-autopairs",
        config = function(plugin, opts)
            require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
            -- add more custom autopairs configuration such as custom rules
            local npairs = require "nvim-autopairs"
            local Rule = require "nvim-autopairs.rule"
            local cond = require "nvim-autopairs.conds"
            npairs.add_rules(
                {
                    Rule("$", "$", { "tex", "latex" })
                        -- don't add a pair if the next character is %
                        :with_pair(
                            cond.not_after_regex "%%"
                        )
                        -- don't add a pair if  the previous character is xxx
                        :with_pair(
                            cond.not_before_regex("xxx", 3)
                        )
                        -- don't move right when repeat character
                        :with_move(
                            cond.after_text "$" and cond.not_before_text "$" or (cond.not_before_text "$$")
                        )
                        -- don't delete if the next character is xx
                        :with_del(
                            cond.not_after_regex "xx"
                        )
                        -- disable adding a newline when you press <cr>
                        :with_cr(cond.none()),
                },
                -- disable for .vim files, but it work for another filetypes
                Rule("a", "a", "-vim")
            )

            local brackets = { { "(", ")" }, { "[", "]" }, { "{", "}" } }
            npairs.add_rules {
                -- Rule for a pair with left-side ' ' and right side ' '
                Rule(" ", " ")
                    -- Pair will only occur if the conditional function returns true
                    :with_pair(
                        function(opts)
                            -- We are checking if we are inserting a space in (), [], or {}
                            local pair = opts.line:sub(opts.col - 1, opts.col)
                            return vim.tbl_contains({
                                brackets[1][1] .. brackets[1][2],
                                brackets[2][1] .. brackets[2][2],
                                brackets[3][1] .. brackets[3][2],
                            }, pair)
                        end
                    )
                    :with_move(cond.none())
                    :with_cr(cond.none())
                    -- We only want to delete the pair of spaces when the cursor is as such: ( | )
                    :with_del(
                        function(opts)
                            local col = vim.api.nvim_win_get_cursor(0)[2]
                            local context = opts.line:sub(col - 1, col + 2)
                            return vim.tbl_contains({
                                brackets[1][1] .. "  " .. brackets[1][2],
                                brackets[2][1] .. "  " .. brackets[2][2],
                                brackets[3][1] .. "  " .. brackets[3][2],
                            }, context)
                        end
                    ),
            }
            -- For each pair of brackets we will add another rule
            for _, bracket in pairs(brackets) do
                npairs.add_rules {
                    -- Each of these rules is for a pair with left-side '( ' and right-side ' )' for each bracket type
                    Rule(bracket[1] .. " ", " " .. bracket[2])
                        :with_pair(cond.none())
                        :with_move(function(opts) return opts.char == bracket[2] end)
                        :with_del(cond.none())
                        :use_key(bracket[2])
                        -- Removes the trailing whitespace that can occur without this
                        :replace_map_cr(
                            function(_) return "<C-c>2xi<CR><C-c>O" end
                        ),
                }
            end
        end,
    },
}

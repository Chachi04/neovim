local api = vim.api

-- Highlight on yank
local yankGroup = api.nvim_create_augroup("YankHighlight", {clear = true})
api.nvim_create_autocmd(
    "TextYankPost",
    {
        command = "silent! lua vim.highlight.on_yank()",
        group = yankGroup
    }
)

local formatGroup = api.nvim_create_augroup("Formating", {clear = true})
api.nvim_create_autocmd(
    "BufWritePre",
    {
        command = "try | undojoin | Neoformat | catch /E790/ | Neoformat | endtry",
        group = formatGroup
    }
)
local templateGroup = api.nvim_create_augroup("Templates", {clear = true})
-- api.nvim_create_autocmd(
--     "BufNewFile",
--     {
--         pattern = {"*.*"},
--         command = "silent! execute '0r ~/.config/nvim/skeletons/skeleton.'.expand('<afile>:e')",
--         group = templateGroup
--     }
-- )
-- api.nvim_create_autocmd(
--     "BufNewFile",
--     {
--         command = "%substitute#[:VIM_EVAL:](.{-})[:END_EVAL:]#=eval(submatch(1))#ge",
--         group = templateGroup
--     }
-- )
-- augroup Templates
--     autocmd!
--     " read in template files
--     autocmd BufNewFile *.* silent! execute '0r ~/.config/nvim/skeletons/skeleton.'.expand("<afile>:e")
--     " parse special text in the templates after the read
--     autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
-- augroup END

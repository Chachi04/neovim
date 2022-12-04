-- local latex_compile = vim.api.nvim_create_augroup("LatexCompile", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	pattern = "*.tex",
-- 	command = "echo 'Hello Latex'",
-- 	group = latex_compile,
-- })
--
vim.g.tex_hello = "Hello Latex"

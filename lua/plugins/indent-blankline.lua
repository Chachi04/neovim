return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		vim.opt.list = true
		vim.opt.listchars:append("eol:↴")
		vim.cmd("highlight IndentBlanklineChar guifg=#333333")
		vim.cmd("highlight IndentBlanklineContextChar guifg=#555555")
		require("indent_blankline").setup({
			show_current_context = true,
			-- show_current_context_start = true,
			show_end_of_line = true,
		})
	end,
}

return {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
	config = function()
		require("ufo").setup({
			provider_selector = function(_, _, _)
				return { "treesitter", "indent" }
			end,
		})

		vim.keymap.set("n", "zO", require("ufo").openAllFolds)
		vim.keymap.set("n", "zC", require("ufo").closeAllFolds)
	end,
}

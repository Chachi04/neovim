return {
	"kylechui/nvim-surround",
	keys = { "ds", "cs", "ys" },
	config = function()
		require("nvim-surround").setup()
	end,
}

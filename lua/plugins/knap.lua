return {
	"frabjous/knap",
	ft = { "latex", "plaintex" },
	keys = {
		"<F5>",
	},
	config = function()
		vim.keymap.set("i", "<F5>", require("knap").process_once)
		vim.keymap.set("v", "<F5>", require("knap").process_once)
		vim.keymap.set("n", "<F5>", require("knap").process_once)
	end,
}

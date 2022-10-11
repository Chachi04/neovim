vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>op", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>r", "<cmd>NvimTreeRefresh<CR>", { noremap = true, silent = true })

require("nvim-tree").setup({
	hijack_unnamed_buffer_when_opening = false,
	reload_on_bufenter = true,
	respect_buf_cwd = true,
	view = {
		preserve_window_proportions = true,
		number = true,
		relativenumber = true,
		signcolumn = "yes",
	},
	renderer = {
		group_empty = true,
		highlight_git = true,
		full_name = true,
		highlight_opened_files = "icon",
		special_files = { "README.org", "README.md", "Makefile", "MAKEFILE", "Cargo.toml" },
	},
	update_focused_file = {
		enable = true,
		update_root = true,
		ignore_list = {},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		dotfiles = false,
		custom = {},
		exclude = { ".env" },
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
})

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- optional, for file icons
	},
	version = "nightly", -- optional, updated every week. (see issue #1193)
	cmd = "NvimTreeToggle",
	keys = { { "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "NvimTree" } },
	config = function()
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

		-- TODO This doesn't work
		-- local nvim_tree_auto_close_group = vim.api.nvim_create_augroup("AutoCloseNvimTree", { clear = true })
		-- vim.api.nvim_create_autocmd("BufEnter", {
		-- 	group = nvim_tree_auto_close_group,
		-- 	nested = true,
		-- 	callback = function()
		-- 		if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
		-- 			vim.cmd("quit")
		-- 		end
		-- 	end,
		-- })
	end,
}

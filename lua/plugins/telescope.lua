return {
	"nvim-telescope/telescope.nvim",
	version = "0.1.0",
	dependencies = { "nvim-lua/plenary.nvim" },

	cmd = "Telescope",
	keys = {
		{ "<C-p>" },
		{ "<leader><leader>" },
		{ "<leader>." },
		{ "<leader>ff" },
		{ "<leader>fa" },
		{ "<leader>/" },
		{ "<leader>gs" },
		{ "<leader>fb" },
		{ "<leader>bi" },
		{ "<leader>fd" },
		{ "<leader>vrc" },
		{ "<leader>fp" },
		{ "<leader>gc" },
		{ "<leader>gb" },
	},
	config = function()
		local actions = require("telescope.actions")
		local action_layout = require("telescope.actions.layout")

		-- Telescope setup
		require("telescope").setup({
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--trim",
				},
				--prompt_prefix = "> ",
				--selection_caret = "> ",
				--entry_prefix = " ",
				file_sorter = require("telescope.sorters").get_fzy_sorter,
				file_ignore_patterns = { "node_modules/*", "vendor/*", "storage/*", "/*.png", "venv/*", "/*.pyc" },
				color_devicons = true,
				use_less = true,
				-- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				-- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				-- qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
				mappings = {
					n = {
						["<M-p>"] = action_layout.toggle_preview,
					},
					i = {
						["<M-p>"] = action_layout.toggle_preview,
						["<C-s>"] = actions.cycle_previewers_next,
						["<C-a>"] = actions.cycle_previewers_prev,
						["<C-x>"] = false,
						["<C-q>"] = actions.send_to_qflist,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						-- ["<CR>"] = actions.select_tab
					},
				},
				layout_strategy = "flex",
				layout_config = {
					horizontal = {
						preview_width = 0.45,
						mirror = false,
					},
					vertical = {
						width = 0.8,
					},
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})

		local project_files = function()
			local opts = { follow = true } -- define here if you want to define something
			local ok = pcall(require("telescope.builtin").git_files, opts)
			if not ok then
				require("telescope.builtin").find_files(opts)
			end
		end

		local search_dotfiles = function()
			require("telescope.builtin").find_files({
				prompt_title = "< VimRC >",
				cwd = "~/.config/nvim",
			})
		end

		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<C-p>", project_files, opts)
		vim.keymap.set("n", "<leader><leader>", project_files, opts)
		vim.keymap.set("n", "<leader>.", require("telescope.builtin").find_files, opts)
		vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, opts)
		vim.keymap.set("n", "<leader>fa", require("telescope.builtin").live_grep, opts)
		vim.keymap.set("n", "<leader>/", require("telescope.builtin").live_grep, opts)
		-- vim.keymap.set("n", "<leader>gs", require("telescope.builtin").grep_string, opts)
		vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, opts)
		vim.keymap.set("n", "<leader>bi", require("telescope.builtin").buffers, opts)
		vim.keymap.set("n", "<leader>fd", require("telescope.builtin").lsp_definitions, opts)
		vim.keymap.set("n", "<leader>vrc", search_dotfiles, opts)
		vim.keymap.set("n", "<leader>fp", search_dotfiles, opts)
		vim.keymap.set("n", "<leader>gc", require("telescope.builtin").git_commits, opts)
		vim.keymap.set("n", "<leader>gb", require("telescope.builtin").git_branches, opts)
		--local builtin = require('telescope.builtin')
		--vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
		--vim.keymap.set('n', '<C-p>', builtin.git_files, {})
		--vim.keymap.set('n', '<leader>ps', function()
		--    builtin.grep_string({search = vim.fn.input("Grep > ")})
		--end, {})
	end,
}

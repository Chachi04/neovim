return {
	"VonHeikemen/lsp-zero.nvim",
	lazy = false,
	event = "InsertEnter",
	keys = { "i", "a", "A", "o", "O" },
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "lukas-reineke/cmp-under-comparator" },
		{ "zbirenbaum/copilot-cmp" },
		{ "zbirenbaum/copilot.lua" },
		-- {"hrsh7th/cmp-cmdline"},
		-- {"f3fora/cmp-spell"},
		-- { "tzachar/cmp-fuzzy-path" },
		-- { "tzachar/cmp-fuzzy-buffer" },
		-- { "mfussenegger/nvim-dap" },
		-- { "rcarriga/nvim-dap-ui" },
		-- { "theHamsta/nvim-dap-virtual-text" },
		-- { "nvim-telescope/telescope-dap.nvim" },
		-- { "mfussenegger/nvim-dap-python" },

		-- Snippets
		{ "L3MON4D3/LuaSnip" },
		{ "rafamadriz/friendly-snippets" },

		-- Debug
		-- use( "rcarriga/cmp-dap" )
	},
	config = function()
		require("mason").setup({
			ui = {
				check_outdated_packages_on_open = false,
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		local lsp = require("lsp-zero")

		lsp.preset("lsp-compe")

		lsp.ensure_installed({
			"tsserver",
			"eslint",
			"sumneko_lua",
			"rust_analyzer",
			"clangd",
			"cssls",
			"html",
			"intelephense",
			"ltex",
			"pyright",
			"sqlls",
		})

		lsp.configure("sumneko_lua", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "on_attach" },
					},
				},
			},
		})

		lsp.on_attach(function(_, bufnr)
			local opts = { buffer = bufnr, remap = false }
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "gx", vim.lsp.buf.code_action, opts)
			-- vim.keymap.set("x", "gx", vim.lsp.buf.range_code_action, opts)
			-- vim.keymap.set("n", "go", vim.lsp.buf.show_line_diagnostics, opts)
			-- vim.keymap.set("n", "gj", vim.lsp.buf., opts)
			-- vim.keymap.set("n", "gk", vim.lsp.buf., opts)
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
		end)

		lsp.setup()

		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		local cmp = require("cmp")

		local cmp_select = { behavior = cmp.SelectBehavior.Insert }
		local luasnip = require("luasnip")
		local cmp_mappings = lsp.defaults.cmp_mappings({
			["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
			["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
			-- ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
			["<Tab>"] = cmp.mapping(function(fallback)
				if luasnip.jumpable(1) then
					luasnip.jump(1)
				elseif cmp.visible() then
					cmp.select_next_item()
					-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
					-- they way you will only jump inside the snippet region
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s" }),
			-- ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				elseif cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<C-Space>"] = cmp.mapping.complete(),
			["<CR>"] = cmp.mapping.confirm({
				-- this is the important line
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			}),
		})

		--cmp.setup({
		--	sorting = {
		--		comparators = {
		--			cmp.config.compare.offset,
		--			cmp.config.compare.exact,
		--			cmp.config.compare.score,
		--			require("cmp-under-comparator").under,
		--			cmp.config.compare.kind,
		--			cmp.config.compare.sort_text,
		--			cmp.config.compare.length,
		--			cmp.config.compare.order,
		--		},
		--	},
		--	completion = {
		--		-- autocomplete = false,
		--		-- completeopt = "menu,menuone,noselect,preview",
		--		-- keyword_length = 0,
		--	},
		--})

		-- lsp.setup_nvim_cmp(lsp.defaults.cmp_config({
		--     completion = {
		--         autocomplete = true,
		--         completeopt = "menu,menuone, noselect,preview",
		--         keyword_length = 0,
		--     },
		-- 	window = {
		-- 		completion = cmp.config.window.bordered(),
		-- 	},
		local cmp_config = lsp.defaults.cmp_config({
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp_mappings,
			sources = cmp.config.sources({
				{ name = "copilot" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "dap" },
				{ name = "spell" },
				-- { name = "vsnip" },
				-- { name = "cmdline" },
			}),
			preselect = cmp.PreselectMode.None,
			sorting = {
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					require("cmp-under-comparator").under,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
			-- completion = {
			-- 	autocomplete = true,
			-- 	completeopt = "menu,menuone,noselect,preview",
			-- 	keyword_length = 0,
			-- },
		})
		cmp.setup(cmp_config)

		require("copilot").setup({
			server_opts_overrides = {
				trace = "verbose",
				settings = {
					editor = {
						showEditorCompletions = true,
					},
					advanced = {
						inlineSuggestCount = 5, -- #completions for getCompletions
					},
				},
			},
		})

		require("copilot_cmp").setup()
	end,
}

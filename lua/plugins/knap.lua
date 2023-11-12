return {
	"frabjous/knap",
	ft = { "latex", "plaintex" },
	keys = { "<F5>", "<F3>" },
	config = function()
		vim.keymap.set("i", "<F5>", require("knap").process_once)
		vim.keymap.set("v", "<F5>", require("knap").process_once)
		vim.keymap.set("n", "<F5>", require("knap").process_once)

		vim.g.kanp_settings = {
			htmloutputext = "html",
			htmltohtml = "none",
			htmltohtmlviewerlaunch = "falkon %outputfile%",
			htmltohtmlviewerrefresh = "none",
			mdoutputext = "html",
			mdtohtml = "pandoc --standalone %docroot% -o %outputfile%",
			mdtohtmlviewerlaunch = "falkon %outputfile%",
			mdtohtmlviewerrefresh = "none",
			mdtopdf = "pandoc %docroot% -o %outputfile%",
			mdtopdfviewerlaunch = "sioyek %outputfile%",
			mdtopdfviewerrefresh = "none",
			markdownoutputext = "html",
			markdowntohtml = "pandoc --standalone %docroot% -o %outputfile%",
			markdowntohtmlviewerlaunch = "falkon %outputfile%",
			markdowntohtmlviewerrefresh = "none",
			markdowntopdf = "pandoc %docroot% -o %outputfile%",
			markdowntopdfviewerlaunch = "sioyek %outputfile%",
			markdowntopdfviewerrefresh = "none",
			texoutputext = "pdf",
			textopdf = "pdflatex -interaction=batchmode -halt-on-error -synctex=1 %docroot%",
			textopdfviewerlaunch = "sioyek --inverse-search 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%1'\"'\"',%2,%3)\"' --new-window %outputfile%",
			-- textopdfviewerlaunch = "mupdf %outputfile%",
			textopdfviewerrefresh = "none",
			textopdfforwardjump = "sioyek --inverse-search 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%1'\"'\"',%2,%3)\"' --reuse-window --forward-search-file %srcfile% --forward-search-line %line% %outputfile%",
			-- textopdfforwardjump = "sioyek --inverse-search 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%1'\"'\"',%2,%3)\"' --reuse-window --forward-search-file %srcfile% --forward-search-line %line% %outputfile%",
			textopdfshorterror = 'A=%outputfile% ; LOGFILE="${A%.pdf}.log" ; rubber-info "$LOGFILE" 2>&1 | head -n 1',
			delay = 250,
		}

		local toggle_autocompile_latex = function()
			if not vim.g.autocompile_latex then
				local compile_latex = vim.api.nvim_create_augroup("AutoCompileLatex", { clear = true })
				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.tex" },
					command = "silent! lua require('knap').process_once()",
					group = compile_latex,
				})
				vim.g.autocompile_latex = true
				vim.notify("Auto compile LaTeX enabled", "info", { title = "LaTex" })
			else
				vim.api.nvim_del_augroup_by_name("AutoCompileLatex")
				vim.g.autocompile_latex = false
				vim.notify("Auto compile LaTeX disabled", "info", { title = "LaTeX" })
			end
		end
		vim.keymap.set("n", "<f3>", toggle_autocompile_latex)
	end,
}

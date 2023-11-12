local indent = 4
local undodir = "/home/chachi/.local/share/nvim/undo"

-- vim.cmd.syntax("enable")
-- vim.cmd.filetype.plugin("off")

vim.opt.exrc = true
vim.opt.secure = true
-- vim.opt.shell = "/usr/bin/zsh"

--  UI
-- vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.modeline = false
vim.opt.signcolumn = "yes" -- auto, no, yes, number
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.pumblend = 0
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

--  Searching
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

--  Ignores
vim.opt.wildmenu = true
vim.opt.wildignorecase = true
vim.opt.wildignore:append({
	"*.o",
	"*.obj",
	"*.~",
	"*.class",
	"*.swp",
	"*.tmp",
	"*.mp3",
	"*.mp4",
	"*.bmp",
	"*.gif",
	"*ico",
	"*.jpg",
	"*.png",
	"*.pdf",
	"*.doc",
	"*.docs",
	"*.ppt",
	"*.pptx",
	"*.rar",
	"*.zip",
	"*.tar",
	"*.tar.gz",
	"*.tar.xz",
	"**/node_moduels/*",
	"**/.git/*",
})

--  Backup
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = undodir
if not vim.fn.isdirectory(undodir) then
	os.execute("mkdir -p " .. undodir)
end

--  Tabs
vim.opt.tabstop = indent
vim.opt.softtabstop = indent
vim.opt.shiftwidth = indent
vim.opt.smarttab = true
vim.opt.shiftround = true
vim.opt.expandtab = true

--  Indents
vim.opt.cindent = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.indentexpr = ""
vim.opt.breakindent = true
vim.opt.copyindent = true

-- Folds
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevel = 99

--  Misc
-- vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.opt.errorbells = false
vim.opt.hidden = true
vim.opt.joinspaces = false
vim.opt.shortmess:append({ c = true })
vim.opt.scrolloff = 10
vim.opt.updatetime = 50
vim.opt.autoread = true
vim.opt.redrawtime = 500
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
vim.g.python3_host_prog = "/usr/bin/python"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
-- ¯\_(ツ)_/¯
-- vim.g.t_8f = "<Esc>[38;2;%lu;%lu;%lum]"

-- helper functions for lazy.nvim
function dump(o)
	if type(o) == "table" then
		local s = "{ "
		for k, v in pairs(o) do
			if type(k) ~= "number" then
				k = '"' .. k .. '"'
			end
			s = s .. "[" .. k .. "] = " .. dump(v) .. ","
		end
		return s .. "} "
	else
		return tostring(o)
	end
end

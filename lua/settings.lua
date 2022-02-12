local utils = require("utils")

local cmd = vim.cmd
local indent = 4
local undodir = "/home/chachi/.local/share/nvim/undo"

cmd "syntax enable"
cmd "filetype plugin indent on"

utils.opt("o", "exrc", true)
utils.opt("o", "secure", true)
-- utils.opt("o", "shell", "/usr/bin/zsh")

-- utils.opt("o", "guicursor", "")
utils.opt("w", "number", true)
utils.opt("w", "relativenumber", true)
utils.opt("b", "modeline", false)
utils.opt("w", "signcolumn", "auto")
utils.opt("o", "showmode", false)
-- utils.opt("o", "termguicolors", true)

utils.opt("o", "hlsearch", false)
utils.opt("o", "ignorecase", true)
utils.opt("o", "smartcase", true)
utils.opt("o", "incsearch", true)

utils.opt("o", "wildmenu", true)
utils.opt("o", "wildignorecase", true)
utils.opt("o", "pumblend", 30)
vim.o.wildignore = vim.o.wildignore .. "*.o,*.obj,*.~,*.class,"
vim.o.wildignore = vim.o.wildignore .. "*.git,"
vim.o.wildignore = vim.o.wildignore .. "*.swp,*.tmp,"
vim.o.wildignore = vim.o.wildignore .. "*.mp3,*.mp4,"
vim.o.wildignore = vim.o.wildignore .. "*.bmp,*.gif,*ico,*.jpg,*.png,"
vim.o.wildignore = vim.o.wildignore .. "*.pdf,*.doc,*.docs,*.ppt,*.pptx,"
vim.o.wildignore = vim.o.wildignore .. "*.rar,*.zip,*.tar,*.tar.gz,*.tar.xz,"

utils.opt("w", "wrap", false)

utils.opt("o", "errorbells", false)
utils.opt("o", "hidden", true)
utils.opt("o", "joinspaces", false)
vim.o.shortmess = vim.o.shortmess .. "c"
utils.opt("o", "scrolloff", 10)
utils.opt("o", "updatetime", 50)

utils.opt("o", "backup", false)
utils.opt("b", "swapfile", false)
utils.opt("b", "undofile", true)
utils.opt("o", "undodir", undodir)
if not vim.fn.isdirectory(undodir) then
    os.execute("mkdir -p " .. undodir)
end

utils.opt("b", "tabstop", indent)
utils.opt("b", "softtabstop", indent)
utils.opt("b", "shiftwidth", indent)
utils.opt("o", "smarttab", true)
utils.opt("o", "shiftround", true)
utils.opt("b", "expandtab", true)

utils.opt("b", "cindent", true)
utils.opt("b", "smartindent", true)
utils.opt("b", "autoindent", true)
utils.opt("b", "indentexpr", "")

utils.opt("o", "completeopt", "menuone,noinsert,noselect")

vim.cmd "let g:python3_host_prog = '/usr/bin/python'"

-- ¯\_(ツ)_/¯
-- vim.g.t_8f = "<Esc>[38;2;%lu;%lu;%lum]"
-- vim.api.nvim_set_var("&t_8f", "<Esc>[38;2;%lu;%lu;%lum")
-- vim.api.nvim_set_var("&t_8f", "<Esc>[48;2;%lu;%lu;%lum")

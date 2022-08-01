local cmd = vim.cmd
local indent = 4
local undodir = "/home/chachi/.local/share/nvim/undo"

cmd "syntax enable"
cmd "filetype plugin indent on"

vim.opt.exrc = true
vim.opt.secure = true
-- vim.opt.shell = "/usr/bin/zsh"

-- UI
-- vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.modeline = false
vim.opt.signcolumn = "auto"
vim.opt.showmode = false
vim.opt.termguicolors = true

-- Searching
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- Ignores
vim.opt.wildmenu = true
vim.opt.wildignorecase = true
vim.opt.pumblend = 30
vim.opt.wildignore:append(
    {
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
        "**/.git/*"
    }
)

vim.opt.wrap = false

vim.opt.errorbells = false
vim.opt.hidden = true
vim.opt.joinspaces = false
vim.opt.shortmess:append({c = true})
vim.opt.scrolloff = 10
vim.opt.updatetime = 50

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = undodir
if not vim.fn.isdirectory(undodir) then
    os.execute("mkdir -p " .. undodir)
end

-- Tabs
vim.opt.tabstop = indent
vim.opt.softtabstop = indent
vim.opt.shiftwidth = indent
vim.opt.smarttab = true
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Indents
vim.opt.cindent = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.indentexpr = ""

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Auto update file that has changed outside of
vim.autoread = true

vim.opt.completeopt = {"menuone", "noinsert", "noselect"}

vim.g.python3_host_prog = "/usr/bin/python"

-- Custom commands
-- cmd "command serv"

-- ¯\_(ツ)_/¯
-- vim.g.t_8f = "<Esc>[38;2;%lu;%lu;%lum]"
-- vim.api.nvim_set_var("&t_8f", "<Esc>[38;2;%lu;%lu;%lum")
-- vim.api.nvim_set_var("&t_8f", "<Esc>[48;2;%lu;%lu;%lum")

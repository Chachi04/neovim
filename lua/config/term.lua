local M = {}
local Terminal = require("toggleterm.terminal").Terminal

local lazygit =
    Terminal:new(
    {
        cmd = "lazygit",
        direction = "float"
    }
)

M.lazygit = function()
    lazygit:toggle()
end

local cpp =
    Terminal:new(
    {
        direction = "float",
        on_open = function(term)
            local file = vim.fn.expand("#")
            local run = vim.fn.expand("#:r")
            vim.fn.jobsend(term.job_id, "mkdir -p compiled\n")
            vim.fn.jobsend(term.job_id, "clear\n")
            vim.fn.jobsend(term.job_id, "g++ " .. file .. " -o compiled/" .. run .. "\n")
            vim.fn.jobsend(term.job_id, "./compiled/" .. run .. "\n")
        end,
        hiddent = true
    }
)

M.cpp = function()
    cpp:toggle()
end

return M

--local term = require("FTerm.terminal")
--   local zsh =
--       term:new():setup(
--       {
--           cmd = "zsh",
--           dimensions = {
--               height = 0.8,
--               width = 0.8,
--               x = 0.5,
--               y = 0.5
--           },
--           border = "single"
--       }
--   )
--
--   M.runCpp = function()
--       -- local file = vim.fn.expand("%")
--       -- local run = vim.fn.expand("%:r")
--       local file = vim.fn.expand("%")
--       local run = vim.fn.expand("%:r")
--       -- if not vim.fn.win_gotoid(vim.g.term_win) then
--       -- end
--       require "term".toggle()
--       local term_id = vim.b.terminal_job_id
--       vim.fn.jobsend(term_id, "mkdir -p compiled\n")
--       vim.fn.jobsend(term_id, "clear\n")
--       vim.fn.jobsend(term_id, "g++ " .. file .. " -o compiled/" .. run .. "\n")
--       vim.fn.jobsend(term_id, "./compiled/" .. run .. "\n")
--   end
--
--   M.toggle = function()
--       zsh:toggle()
--       vim.g.term_win = vim.fn.win_getid()
--   end
--
--   return M

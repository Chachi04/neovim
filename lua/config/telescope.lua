local M = {}

M.project_files = function()
    local opts = {follow = true} -- define here if you want to define something
    local ok = pcall(require "telescope.builtin".git_files, opts)
    if not ok then
        require "telescope.builtin".find_files(opts)
    end
end

M.search_dotfiles = function()
    require("telescope.builtin").find_files(
        {
            prompt_title = "< VimRC >",
            cwd = "~/.config/nvim"
        }
    )
end

-- M.git_branches = function()
--     require("telescope.builtin").git_braches(
--         {
--             attach_mappings = function(_, map)
--                 map("i", "<C-d>", actions.git_delete_branch)
--                 map("n", "<C-d>", actions.git_delete_branch)
--                 return true
--             end
--         }
--     )
-- end

return M

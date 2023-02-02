require("settings")

require("mappings")

require("autocmds")

require("lazy").setup("plugins", { change_detection = { notify = false } })

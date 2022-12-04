-- F5 processes the document once, and refreshes the view
vim.keymap.set("i", "<F5>", require("knap").process_once)
vim.keymap.set("v", "<F5>", require("knap").process_once)
vim.keymap.set("n", "<F5>", require("knap").process_once)

-- F6 closes the viewer application, and allows settings to be reset
vim.keymap.set("i", "<F6>", require("knap").close_viewer)
vim.keymap.set("v", "<F6>", require("knap").close_viewer)
vim.keymap.set("n", "<F6>", require("knap").close_viewer)

-- F7 toggles the auto-processing on and off
vim.keymap.set("i", "<F7>", require("knap").toggle_autopreviewing)
vim.keymap.set("v", "<F7>", require("knap").toggle_autopreviewing)
vim.keymap.set("n", "<F7>", require("knap").toggle_autopreviewing)

-- F8 invokes a SyncTeX forward search, or similar, where appropriate
vim.keymap.set("i", "<F8>", require("knap").forward_jump)
vim.keymap.set("v", "<F8>", require("knap").forward_jump)
vim.keymap.set("n", "<F8>", require("knap").forward_jump)

local gknapsettings = {
	delay = 500,
}
vim.g.knap_settings = gknapsettings

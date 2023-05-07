vim.g.mapleader = " " -- Needs to be set before lazy.nvim

-- require("jxbp.packer")
require("jxbp.settings")
require("jxbp.lazy")
require("jxbp.remap")

vim.api.nvim_create_user_command("ToggleFormatOnSave", function()
	vim.g.format_on_save = not vim.g.format_on_save
end, {})

-- Suppress a warning with null-ls and clang-format
local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") then
		return
	end

	notify(msg, ...)
end

-- vim.cmd([[autocmd VimEnter * :ZenMode]])
-- vim.cmd([[autocmd VimEnter * Twilight]])

return {
	--[[
	{
		"akinsho/bufferline.nvim",
		config = function()
			local bufferline = require("bufferline")
			bufferline.setup({
				options = {
					style_preset = {
						bufferline.style_preset.no_italic,
						bufferline.style_preset.no_bold,
					},
					show_close_icon = false,
					show_buffer_close_icons = false,
					diagnostics = "nvim_lsp",
					diagnostics_indicator = function(count, level)
						local icon = level:match("error") and " " or ""
						return " " .. icon .. count
					end,
				},
			})
		end,
	},
    ]]
}

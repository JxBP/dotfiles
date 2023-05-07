-- Returns a function that can be passed to lazy.nvim's config parameter to set
-- the desired colorscheme if set in vim.g.jxbp_colorscheme.
local apply_color = function(colorscheme)
	if vim.g.jxbp_colorscheme == colorscheme then
		return function()
			vim.g.gruvbox_material_background = "hard"

			vim.cmd("colorscheme " .. colorscheme)

			if vim.g.jxbp_transparent_bg then
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
				vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
			end
		end
	end
end

return {
	{ "shaunsingh/solarized.nvim", config = apply_color("solarized") },
	{ "sainnhe/gruvbox-material", config = apply_color("gruvbox-material") },
}

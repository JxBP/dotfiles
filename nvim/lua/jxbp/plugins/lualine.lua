return {
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				sections = {
					lualine_c = {
						"navic",
					},
				},
			})
		end,
		dependencies = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
	},
}

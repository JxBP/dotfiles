return {
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			-- require("telescope").load_extension("dap")
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-dap.nvim",
		},
	},
}

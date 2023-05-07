return {
	{
		"ghillb/cybu.nvim",
		requires = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
		config = function()
			local cybu = require("cybu")
			cybu.setup()
			vim.keymap.set("n", "<tab>", "<Plug>(CybuPrev)")
			vim.keymap.set("n", "<S-tab>", "<Plug>(CybuNext)")
		end,
	},
}

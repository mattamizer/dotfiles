return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/neotest-python",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python"),
			},
		})
	end,
}

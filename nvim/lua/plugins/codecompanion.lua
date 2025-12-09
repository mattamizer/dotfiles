return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		adapters = {},
		extensions = {},
	},
	keys = {
		{ "<leader>at", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle Code Companion Chat", mode = { "n", "v" } },
		{ "<leader>ac", "<cmd>CodeCompanionActions<cr>", desc = "Code Companion Actions", mode = { "n", "v" } },
		{ "ga", "<cmd>CodeCompanionChat Add<cr>", desc = "Add to Code Companion Chat", mode = { "v" } },
	},
}

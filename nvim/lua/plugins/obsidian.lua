return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ui = { enable = false },
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "MattVault",
				path = "~/Obsidian/Mattvault",
			},
		},
	},
	config = function(_, opts)
		require("obsidian").setup(opts)
	end,
}

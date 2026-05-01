return {
	"stevearc/conform.nvim",
	dependencies = {
		{
			"prettier/vim-prettier",
			build = { "yarn install --frozen-lockfile --production" },
		},
	},
	opts = {
		formatters_by_ft = {
			tf = { "tfmt" },
			terraform = { "tfmt" },
			hcl = { "tfmt" },
		},
		formatters = {
			tfmt = {
				command = "tofu",
				args = { "fmt", "-" },
				stdin = true,
			},
		},
	},
}

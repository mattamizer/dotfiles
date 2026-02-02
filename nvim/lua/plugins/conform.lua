return {
	"stevearc/conform.nvim",
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

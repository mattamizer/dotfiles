return {
	"stevearc/conform.nvim",
	opts = function()
		local opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				markdown = { "mdformat", "markdownlint-cli2", "prettier" },
				markdown_inline = { "mdformat", "markdownlint-cli2", "prettier" },
				python = { "black" },
				sh = { "shfmt" },
				hcl = { "packer_fmt" },
				terraform = { "terraform_fmt" },
				tf = { "terraform_fmt" },
				["terraform-vars"] = { "terraform_fmt" },
			},
			formatters = {
				prettier = {
					prepend_args = { "--prose-wrap", "always" },
				},
			},
		}
		return opts
	end,
}

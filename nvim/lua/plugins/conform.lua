return {
	"stevearc/conform.nvim",
	opts = function()
		local opts = {
			default_format_opts = {
				timemout_ms = 10000,
			},
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
			log_level = vim.log.levels.DEBUG,
		}
		return opts
	end,
}

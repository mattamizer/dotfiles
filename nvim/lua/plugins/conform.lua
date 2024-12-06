return {
	"stevearc/conform.nvim",
	opts = function()
		--@type conform.setupOpts
		local opts = {
			default_format_opts = {
				timeout_ms = 3000,
				async = false, -- not recommended to change
				quiet = false, -- not recommended to change
				lsp_format = "fallback", -- not recommended to change
			},
			formatters_by_ft = {
				lua = { "stylua" },
				markdown = { "prettier", "markdownlint-cli2" },
				python = { "black" },
				sh = { "shfmt" },
			},
		}
		return opts
	end,
}

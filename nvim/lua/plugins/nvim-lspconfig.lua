local util = require("lspconfig").util
return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			eslint = {},
			snyk_ls = {
				mason = false,
				default_config = {
					cmd = { "/opt/homebrew/bin/snyk", "language-server", "-l", "debug" },
					root_dir = util.root_pattern(".git", ".snyk"),
					filetypes = {
						"go",
						"gomod",
						"javascript",
						"typescript",
						"json",
						"python",
						"requirements",
						"helm",
						"yaml",
						"terraform",
						"terraform-vars",
					},
					single_file_support = true,
					settings = {},
					-- Configuration from https://github.com/snyk/snyk-ls#configuration-1
					init_options = {
						activateSnykCode = "true",
						organization = "Relay Network",
						token = "cmd:op read op://Employee/SnykToken/credential --no-newline",
						path = "/opt/homebrew/bin/snyk",
					},
				},
			},
		},
		setup = {
			eslint = function()
				require("lazyvim.util").lsp.on_attach(function(client)
					if client.name == "eslint" then
						client.server_capabilities.documentFormattingProvider = true
					elseif client.name == "tsserver" then
						client.server_capabilities.documentFormattingProvider = false
					end
				end)
			end,
		},
	},
}

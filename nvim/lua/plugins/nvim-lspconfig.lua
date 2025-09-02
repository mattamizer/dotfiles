return {
	"neovim/nvim-lspconfig",
	event = "LazyFile",
	dependencies = {
		"mason.nvim",
		{ "mason-org/mason-lspconfig.nvim", config = function() end },
	},
	opts = {
		servers = {
			eslint = {},
			snyk_ls = {
				mason = false,
				cmd = { "/opt/homebrew/bin/snyk", "language-server" },
				root_markers = { ".git", ".snyk" },
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
				settings = {},
				-- Configuration from https://github.com/snyk/snyk-ls#configuration-1
				init_options = {
					activateSnykCode = "true",
					authenticationMethod = "oauth",
					automaticAuthentication = "true",
					cliPath = "/opt/homebrew/bin/snyk",
					organization = "relay-network",
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

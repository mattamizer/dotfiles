return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"ravitemer/mcphub.nvim",
	},
	opts = {
		adapters = {
			openai = function()
				return require("codecompanion.adapters").extend("openai", {
					opts = {
						stream = true,
					},
					env = {
						api_key = "cmd:op read op://Employee/OpenAIKey/credential --no-newline",
					},
					schema = {
						model = {
							default = function()
								return "gpt-4o"
							end,
						},
					},
				})
			end,
		},
		extensions = {
			mcphub = {
				callback = "mcphub.extensions.codecompanion",
				opts = {
					make_tools = true, -- Generate mcp tools from prompts
					show_server_tools_in_chat = true, -- Show available mcp tools in chat
					show_result_in_chat = true, -- Show mcp tool results in chat
					make_vars = true, -- Convert resources to #variables
					make_slash_commands = true, -- Add prompts as /slash commands
				},
			},
		},
	},
}

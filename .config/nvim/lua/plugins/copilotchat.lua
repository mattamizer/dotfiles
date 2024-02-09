local prompts = {
	-- Code related prompts
	Explain = "Please explain how the following code works.",
	Review = "Please review the following code and provide suggestions for improvement.",
	Tests = "Please explain how the selected code works, then generate unit tests for it.",
	Refactor = "Please refactor the following code to improve its clarity and readability.",
	-- Text related prompts
	Summarize = "Please summarize the following text.",
	Spelling = "Please correct any grammar and spelling errors in the following text.",
	Wording = "Please improve the grammar and wording of the following text.",
	Concise = "Please rewrite the following text to make it more concise.",
}

return {
	-- Import the copilot plugin
	{ import = "lazyvim.plugins.extras.coding.copilot" },
	{
		"jellydn/CopilotChat.nvim",
		-- Will be merged to main branch soon
		dependencies = { "github/copilot.vim" },
		branch = "canary",
		opts = {
			mode = "split",
			show_help = "yes",
			prompts = prompts,
		},
		build = function()
			vim.defer_fn(function()
				vim.cmd("UpdateRemotePlugins")
				vim.notify("CopilotChat - Updated remote plugins. Please restart Neovim.")
			end, 3000)
		end,
		event = "VeryLazy",
	},
}

return {
	"CopilotC-Nvim/CopilotChat.nvim",
	event = "VeryLazy",
	opts = {
		prompts = {
			Explain = "Explain how it works.",
			Review = "Review the following code and provide concise suggestions.",
			Tests = "Briefly explain how the selected code works, then generate unit tests.",
			Refactor = "Refactor the code to improve clarity and readability.",
		},
	},
	build = function()
		vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
	end,
	config = function()
		local present, wk = pcall(require, "which-key")
		if not present then
			return
		end

		wk.register({
			c = {
				c = {
					name = "Copilot Chat",
				},
			},
		}, {
			mode = "n",
			prefix = "<leader>",
			silent = true,
			noremap = true,
			nowait = false,
		})
	end,
	keys = {
		{ "<leader>ccc", ":CopilotChat ", desc = "CopilotChat - Prompt" },
		{ "<leader>cce", ":CopilotChatExplain ", desc = "CopilotChat - Explain code" },
		{ "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
		{ "<leader>ccr", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
		{ "<leader>ccR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
	},
}

return {
	{
		"zbirenbaum/copilot.lua",
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = false,
				},
				suggestion = {
					enabled = false,
				},
			})

			-- hide copilot suggestions when cmp menu is open
			-- to prevent odd behavior/garbled up suggestions
			local cmp_status_ok, cmp = pcall(require, "cmp")
			if cmp_status_ok then
				cmp.event:on("menu_opened", function()
					vim.b.copilot_suggestion_hidden = true
				end)

				cmp.event:on("menu_closed", function()
					vim.b.copilot_suggestion_hidden = false
				end)
			end
		end,
	},
}

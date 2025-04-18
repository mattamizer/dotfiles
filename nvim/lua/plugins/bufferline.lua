return {
	"akinsho/bufferline.nvim",
	optional = true,
	keys = {
		{ "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Jump to buffer" },
		{ "<leader>bf", "<cmd>Telescope buffers previewer=false<cr>", desc = "Find buffer" },
		{ "<leader>bb", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
		{ "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
		{ "<leader>be", "<cmd>BufferLinePickClose<cr>", desc = "Pick which buffer to close" },
		{ "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", desc = "Close all to the left" },
		{ "<leader>bl", "<cmd>BufferLineCloseRight<cr>", desc = "Close all to the right" },
	},
	opts = function(_, opts)
		if (vim.g.colors_name or ""):find("catppuccin") then
			opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
		end
	end,
}

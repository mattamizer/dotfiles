return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"ravitemer/mcphub.nvim",
	},
	opts = function(_, opts)
		table.insert(opts.sections.lualine_x, {
			require("mcphub.extensions.lualine"),
		})
	end,
}

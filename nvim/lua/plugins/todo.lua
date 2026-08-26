return {
	"atiladefreitas/dooing",
	config = function()
		require("dooing").setup({
			pretty_print_json = true,
			per_project = { auto_gitignore = true },
			ui = { style = "modern" },
			window = {
				dimensions = function()
					return {
						width = math.max(40, math.floor(vim.o.columns * 0.4)),
						height = math.max(10, math.floor(vim.o.lines * 0.6)),
					}
				end,
			},
		})
	end,
}

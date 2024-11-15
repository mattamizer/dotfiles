-- Catppuccin Theme
return {
	{
		-- https://github.com/catppuccin/nvim
		"catppuccin/nvim",
		name = "catppuccin", -- name is needed otherwise plugin shows up as "nvim" due to github URI
		lazy = false, -- We want the colorscheme to load immediately when starting Neovim
		priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
		opts = {
			--   -- Replace this with your scheme-specific settings or remove to use the defaults
			-- transparent = true,
			flavour = "macchiato", -- "latte, frappe, macchiato, mocha"
			integrations = {
				aerial = true,
				alpha = true,
				cmp = true,
				dap = true,
				dap_ui = true,
				dashboard = true,
				flash = true,
				gitsigns = true,
				headlines = true,
				illuminate = true,
				indent_blankline = { enabled = true },
				leap = true,
				lsp_trouble = true,
				mason = true,
				markdown = true,
				mini = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				navic = { enabled = true, custom_bg = "lualine" },
				neotest = true,
				neotree = true,
				noice = true,
				notify = true,
				semantic_tokens = true,
				telescope = true,
				treesitter = true,
				treesitter_context = true,
				which_key = true,
				nvimtree = true,
				rainbow_delimiters = true,
			},
		},
		specs = {
			{
				"akinsho/bufferline.nvim",
				optional = true,
				opts = function(_, opts)
					if (vim.g.colors_name or ""):find("catppuccin") then
						opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
					end
				end,
			},
		},
	},
	{ "LazyVim/LazyVim", opts = { colorscheme = "catppuccin" } },
}

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"ravitemer/mcphub.nvim",
		{ "catppuccin/nvim", name = "catppuccin" },
	},
	opts = function(_, opts)
		opts.sections.lualine_x = {
			{
				function()
					-- Check if MCPHub is loaded
					if not vim.g.loaded_mcphub then
						return "󰐻 -"
					end

					local count = vim.g.mcphub_servers_count or 0
					local status = vim.g.mcphub_status or "stopped"
					local executing = vim.g.mcphub_executing

					-- Show "-" when stopped
					if status == "stopped" then
						return "󰐻 -"
					end

					-- Show spinner when executing, starting, or restarting
					if executing or status == "starting" or status == "restarting" then
						local frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
						local frame = math.floor(vim.loop.now() / 100) % #frames + 1
						return "󰐻 " .. frames[frame]
					end

					return "󰐻 " .. count
				end,
				color = function()
					-- TODO: Figure out how to load the colors from the colorscheme
					local macchiato = require("catppuccin.palettes").get_palette("macchiato")
					if not vim.g.loaded_mcphub then
						return { fg = macchiato.overlay0 } -- Gray for not loaded
					end

					local status = vim.g.mcphub_status or "stopped"
					if status == "ready" or status == "restarted" then
						return { fg = macchiato.green } -- Green for connected
					elseif status == "starting" or status == "restarting" then
						return { fg = macchiato.peach } -- Orange for connecting
					else
						return { fg = macchiato.red } -- Red for error/stopped
					end
				end,
			},
		}
	end,
}

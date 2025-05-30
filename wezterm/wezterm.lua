local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config = {
	color_scheme = "Catppuccin Macchiato",
	default_workspace = "~/dotfiles",
	font = wezterm.font("IosevkaTerm Nerd Font"),
	font_size = 16.0,
	leader = { key = "a", mods = "CTRL" },
	macos_window_background_blur = 30,
	window_background_opacity = 1.0,
	window_decorations = "RESIZE",
}
wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

-- Keybindings
config.keys = {
	{
		key = "f",
		mods = "LEADER",
		action = act.ToggleFullScreen,
	},
	{
		mods = "LEADER",
		key = "-",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "=",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "z",
		action = act.TogglePaneZoomState,
	},
	-- rotate panes
	{
		mods = "LEADER",
		key = "Space",
		action = act.RotatePanes("Clockwise"),
	},
}

-- Plugins
wezterm.plugin.update_all()
-- Tabline configuration
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
	options = {
		theme = "Catppuccin Macchiato",
	},
})
tabline.apply_to_config(config)

-- Sessionizer
local sessionizer = wezterm.plugin.require("https://github.com/mikkasendke/sessionizer.wezterm")
local schema = {
	wezterm.home_dir .. "/code",
	wezterm.home_dir .. "/dotfiles",
	wezterm.home_dir .. "/Obsidian/MattVault",
	sessionizer.FdSearch({ wezterm.home_dir .. "/code", fd_path = "/opt/homebrew/bin/fd" }),
	processing = sessionizer.for_each_entry(function(entry)
		entry.label = entry.label:gsub(wezterm.home_dir, "~")
	end),
}
table.insert(config.keys, {
	key = "s",
	mods = "LEADER",
	action = sessionizer.show(schema),
})

-- Smart Splits
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
smart_splits.apply_to_config(config, {
	direction_keys = { "h", "j", "k", "l" },
	modifiers = {
		move = "CTRL",
		resize = "ALT",
	},
})

return config

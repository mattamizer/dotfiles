local wezterm = require("wezterm")
local act = wezterm.action

local keys = {
	{
		key = "g",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			local current_tab_id = pane:tab():tab_id()
			local cmd = "lazygit ; wezterm cli activate-tab --tab-id " .. current_tab_id .. " ; exit\n"
			local tab, tab_pane, _ = window:mux_window():spawn_tab({})
			tab_pane:send_text(cmd)
			tab:set_title(wezterm.nerdfonts.dev_git .. " Lazygit")
		end),
	},
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
	{
		mods = "LEADER",
		key = "o",
		action = act.ActivateLastTab,
	},
	{
		mods = "LEADER",
		key = "t",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "LEADER",
		key = "w",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	-- rotate panes
	{
		mods = "LEADER",
		key = "Space",
		action = act.RotatePanes("Clockwise"),
	},
}

local function tab_switch_keys(key_table, modifier)
	for i = 1, 9 do
		table.insert(key_table, {
			key = tostring(i),
			mods = modifier,
			action = act.ActivateTab(i - 1),
		})
	end
	table.insert(key_table, {
		key = "0",
		mods = modifier,
		action = act.ActivateTab(9),
	})
end

tab_switch_keys(keys, "CTRL")

return keys

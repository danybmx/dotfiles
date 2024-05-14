local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = 'Night Owl (Gogh)'
config.font = wezterm.font('GeistMono Nerd Font', { weight = 400 })
config.font_size = 13
config.line_height = 1.1
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 4,
	right = 4,
	top = 4,
	bottom = 4,
}
config.keys = {
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "d",
		mods = "SHIFT|CMD",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "m",
		mods = "CMD",
		action = wezterm.action.PaneSelect,
	},
}
config.initial_rows = 40
config.initial_cols = 140

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

return config

local wezterm = require("wezterm")
local config = wezterm.config_builder()

local function is_vim(pane)
	local process_name = string.gsub(pane:get_foreground_process_name(), "(.*[/\\])(.*)", "%2")
	print(process_name)
	return process_name == "nvim" or process_name == "vim"
end

local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "META" or "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

config.color_scheme = "Tokyo Night"
-- config.font = wezterm.font("mplus Nerd Font Mono")
config.font = wezterm.font("PragmataPro Mono")
config.font_size = 16
config.line_height = 1.2
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.95
config.macos_window_background_blur = 6
config.native_macos_fullscreen_mode = true
config.window_padding = {
	left = 4,
	right = 4,
	top = 4,
	bottom = 4,
}
-- Leader is the same as my old tmux prefix
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- splitting
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "=",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "m",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		mods = "LEADER",
		key = "Space",
		action = wezterm.action.RotatePanes("Clockwise"),
	},
	{
		mods = "LEADER",
		key = "q",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	-- show the pane selection mode, but have it swap the active and selected panes
	{
		mods = "LEADER",
		key = "0",
		action = wezterm.action.PaneSelect({
			mode = "SwapWithActive",
		}),
	},
	-- nvim
	-- move between split panes
	split_nav("move", "h"),
	split_nav("move", "j"),
	split_nav("move", "k"),
	split_nav("move", "l"),
	-- resize panes
	split_nav("resize", "h"),
	split_nav("resize", "j"),
	split_nav("resize", "k"),
	split_nav("resize", "l"),
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

wezterm.on("gui-startup", function()
	local screen = wezterm.gui.screens().active
	local _, _, window = wezterm.mux.spawn_window({})

	local gui_window = window:gui_window()

	-- Set dimensions to 85% of current screen size
	-- The actual dimensions will be a bit bigger if we take into
	-- account the decorations on top
	local width = screen.width * 0.80
	local height = screen.height * 0.80

	gui_window:set_inner_size(width, height)

	-- Position the window at the center of the screen
	local dimensions = gui_window:get_dimensions()
	local x = (screen.width - dimensions.pixel_width) * 0.5
	local y = (screen.height - dimensions.pixel_height) * 0.5

	gui_window:set_position(x, y)
end)

config.colors = {
	foreground = "#EFEFFD",
	background = "#2B2233",
	cursor_bg = "#F8F8F8",
	cursor_fg = "#282a36",
	cursor_border = "#282a36",
	selection_fg = "white",
	selection_bg = "#492949",
	scrollbar_thumb = "#222222",
	split = "#444444",
	ansi = {
		"black",
		"#FF98B3",
		"#C0FF98",
		"#EDFF98",
		"#FFD298",
		"#FF67D4",
		"#98FFFB",
		"silver",
	},
}

return config

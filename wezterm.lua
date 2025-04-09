local wezterm = require("wezterm")
local config = wezterm.config_builder()

local function is_vim(pane)
	local process_name = string.gsub(pane:get_foreground_process_name(), "(.*[/\\])(.*)", "%2")
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

config.color_scheme = "Tokyo Night"
-- config.font = wezterm.font_with_fallback({ { family = "Jetsevka", weight = 500 }, { family = "GoMono Nerd Font Mono" } })
-- config.font = wezterm.font("M+1Code Nerd Font Mono")
-- config.font = wezterm.font("GoMono Nerd Font")
-- config.font = wezterm.font("FiraCode Nerd Font")
-- config.font = wezterm.font("MonoLisa")
-- config.font = wezterm.font("Monaspace Neon")
-- config.font = wezterm.font("CommitMono Nerd Font")
-- config.font = wezterm.font("ComicShannsMono Nerd Font")
-- config.font = wezterm.font("ZedMono Nerd Font", { stretch = "Expanded" })
-- config.font = wezterm.font("ZedMono Nerd Font", { weight = 500 })
-- config.font = wezterm.font("Monaspace Neon")
-- config.font = wezterm.font("AnonymicePro Nerd Font")
-- config.font = wezterm.font_with_fallback({ { family = "Dank Mono" }, { family = "GoMono Nerd Font Mono" } })
-- config.font = wezterm.font_with_fallback({ { family = "Comic Mono" }, { family = "GoMono Nerd Font Mono" } })
-- config.font = wezterm.font("VictorMono Nerd Font")
-- config.font = wezterm.font("MartianMono Nerd Font", { stretch = "Condensed" })
config.font = wezterm.font("CaskaydiaCove Nerd Font", { weight = 300 })
-- config.font = wezterm.font("Liga SFMono Nerd Font")
config.font_size = 13
config.line_height = 1.3
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.92
config.macos_window_background_blur = 6
-- config.native_macos_fullscreen_mode = true
--
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
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
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
	local width = screen.width * 0.60
	local height = screen.height * 0.60

	gui_window:set_inner_size(width, height)

	-- Position the window at the center of the screen
	local dimensions = gui_window:get_dimensions()
	local x = (screen.width - dimensions.pixel_width) * 0.5
	local y = (screen.height - dimensions.pixel_height) * 0.5

	gui_window:set_position(x, y)
end)

config.scrollback_lines = 10000000

return config

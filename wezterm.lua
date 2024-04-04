local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Tokyo Night'
config.font = wezterm.font 'FiraCode Nerd Font'
config.font_size = 14
config.line_height = 1.2
config.hide_tab_bar_if_only_one_tab = true
config.keys = {
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  {
    key = 'd',
    mods = 'SHIFT|CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  {
    key = 'm',
    mods = 'CMD',
    action = wezterm.action.PaneSelect
  },
}
config.initial_rows = 36
config.initial_cols = 120

return config

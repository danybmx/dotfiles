local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Batman'
config.font = wezterm.font 'CaskaydiaCove Nerd Font'
config.font_size = 14
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
  }
}

return config

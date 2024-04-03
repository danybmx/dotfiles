local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Batman'
config.font = wezterm.font 'CaskaydiaCove Nerd Font'
config.font_size = 14

return config

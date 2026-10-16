local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.default_prog = { 'fish', '-l' }

return config

-- pull in the wezterm API
local wezterm = require 'wezterm'

-- custom configs
local top_bar_color_scheme = require 'configs.top_bar_color_scheme'
local keys = require 'configs.keys'
local theme = require 'configs.theme'

-- init the table that will hold the configuration.
local config = {}

-- init the wezterm configs
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.bypass_mouse_reporting_modifiers = 'ALT'

-- set theme like font, color scheme and this kind of stuff
theme(config)

-- set color scheme for the top bar
top_bar_color_scheme(config)

-- setup custom keys
keys(config)

-- and finally, return the configuration to wezterm
return config

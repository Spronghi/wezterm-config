-- pull in the wezterm API
local wezterm = require 'wezterm'
local helpers = require 'helpers'
-- custom configs
local keys = require 'configs.keys'
local color_scheme = require 'configs.color_scheme'

-- init the table that will hold the configuration.
local config = {}

-- init the wezterm configs
if wezterm.config_builder then
  config = wezterm.config_builder()
end

if helpers.is_windows() then
  config.default_domain = 'WSL:Ubuntu'
end
config.bypass_mouse_reporting_modifiers = 'ALT'

-- set theme like font, color scheme and this kind of stuff
color_scheme(config)

-- setup custom keys
keys(config)

-- and finally, return the configuration to wezterm
return config

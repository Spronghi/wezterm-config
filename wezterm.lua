local wezterm = require 'wezterm'

-- custom configs
local keys = require 'configs.keys'
local color_scheme = require 'configs.color_scheme'
local wsl_domains = require 'configs.wsl_domains'

-- init the table that will hold the configuration.
local config = {}

-- init the wezterm configs
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.bypass_mouse_reporting_modifiers = 'ALT'

-- set theme like font, color scheme and this kind of stuff
color_scheme(config)

-- setup custom keys
keys(config)

-- setup WSL specific logic
wsl_domains(config)

-- and finally, return the configuration to wezterm
return config

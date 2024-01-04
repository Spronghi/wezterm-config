-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Ayu Dark (Gogh)'
config.font_size = 15.0
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false

wezterm.font = wezterm.font 'CaskaydiaMono Nerd Font Mono'

config.keys = {}

for i = 1, 8 do
  -- CTRL+ALT + number to move to that position
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'ALT',
    action = wezterm.action.MoveTab(i - 1),
  })
end
-- and finally, return the configuration to wezterm
return config

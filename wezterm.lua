local helpers = require 'helpers'
-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

if not helpers.is_windows() then
  config.font_size = 15.0
else
  config.font_size = 12.0
end

config.color_scheme = 'Ayu Dark (Gogh)'
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = true

wezterm.font = wezterm.font 'CaskaydiaMono Nerd Font Mono'

config.keys = {
  -- ALT + w to close the current tab
  {
    key = 'w',
    mods = 'ALT',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
  -- ALT + t to open a new tab
  {
    key = 't',
    mods = 'ALT',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  }
}

for i = 1, 8 do
  -- ALT + number to move to that position
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'ALT',
    action = wezterm.action.ActivateTab(i - 1),
  })
end

-- and finally, return the configuration to wezterm
return config

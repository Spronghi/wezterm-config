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
config.font_size = 13.0
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = true

wezterm.font = wezterm.font 'CaskaydiaMono Nerd Font Mono'

config.keys = {
  {
    key = 'w',
    mods = 'ALT',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
  {
    key = 't',
    mods = 'ALT',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  }
}

for i = 1, 8 do
  -- CTRL+ALT + number to move to that position
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'ALT',
    action = wezterm.action.ActivateTab(i - 1),
  })
end

-- and finally, return the configuration to wezterm
return config

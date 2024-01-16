local helpers = require 'helpers'
-- Pull in the wezterm API
local wezterm = require 'wezterm'
-- Wezterm actions
local act = wezterm.action

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
    config.font_size = 11.0
end

config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = true

wezterm.font = wezterm.font 'CaskaydiaMono Nerd Font Mono'

-- color scheme
config.color_scheme = 'Ayu Dark (Gogh)'
config.colors = {
    cursor_fg = 'white',
}

config.keys = {
    -- Close the current pane
    {
        key = 'w',
        mods = 'ALT',
        action = act.CloseCurrentPane { confirm = true },
    },

    -- New tab
    {
        key = 't',
        mods = 'ALT',
        action = act.SpawnTab 'CurrentPaneDomain',
    },
}

for i = 1, 8 do
    -- ALT + number to move to that position
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'ALT',
        action = act.ActivateTab(i - 1),
    })
end

-- and finally, return the configuration to wezterm
return config

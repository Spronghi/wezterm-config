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

config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = true
config.bypass_mouse_reporting_modifiers = 'ALT'

wezterm.font = wezterm.font 'CaskaydiaMono Nerd Font Mono'

-- leader key
config.leader = { key = ' ', mods = 'CTRL', timeout_milliseconds = 1000 }

-- color scheme
config.color_scheme = 'Ayu Dark (Gogh)'
config.colors = {
  cursor_fg = 'white',
}

config.keys = {
  -- Close the current tab
  {
    key = 'w',
    mods = 'ALT|CMD',
    action = act.CloseCurrentTab { confirm = true },
  },

  -- New tab
  {
    key = 't',
    mods = 'ALT|CMD',
    action = act.SpawnTab 'CurrentPaneDomain',
  },

  -- split pane horizontally
  {
    key = 'v',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },

  -- split pane vertically
  {
    key = 's',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },

  -- split pane vertically as small screen
  {
    key = 'o',
    mods = 'LEADER',
    action = wezterm.action.SplitPane {
      direction = 'Down',
      size = { Percent = 20 },
    }
  },

  -- zoom current pane
  {
    key = 'z',
    mods = 'LEADER',
    action = wezterm.action.TogglePaneZoomState,
  },

  -- close current pane
  {
    key = 'w',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },

  -- list open tabs
  {
    key = 'e',
    mods = 'LEADER',
    action = wezterm.action.ShowTabNavigator
  },


  -- rotate panes
  {
    key = 'r',
    mods = 'LEADER',
    action = act.RotatePanes 'CounterClockwise',
  },

  -- set numbers of the panes
  {
    key = "p",
    mods = "CTRL",
    action = wezterm.action { PaneSelect = {} }
  },

}

for i = 1, 8 do
  -- ALT + number to move to that position
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CMD|ALT',
    action = act.ActivateTab(i - 1),
  })
end

-- and finally, return the configuration to wezterm
return config

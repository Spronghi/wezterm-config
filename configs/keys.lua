-- Pull in the wezterm API
local wezterm = require 'wezterm'
-- Wezterm actions
local act = wezterm.action

return function(config)
  -- leader key
  config.leader = { key = ' ', mods = 'CTRL', timeout_milliseconds = 4000 }

  config.keys = {
    -- Close the current tab
    {
      key = 'w',
      mods = 'ALT',
      action = act.CloseCurrentTab { confirm = true },
    },

    -- prevent windwos from writing ^[[200~ when pasting
    {
      key = 'v',
      mods = 'CTRL',
      action = wezterm.action.Nop
    },

    -- new tab
    {
      key = 't',
      mods = 'ALT',
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

    -- activate copy mode
    {
      key = 'x',
      mods = 'LEADER',
      action = wezterm.action.ActivateCopyMode
    },

    -- vim motions to move through panes
    {
      key = 'h',
      mods = 'CTRL',
      action = act.ActivatePaneDirection 'Left',
    },
    {
      key = 'l',
      mods = 'CTRL',
      action = act.ActivatePaneDirection 'Right',
    },
    {
      key = 'k',
      mods = 'CTRL',
      action = act.ActivatePaneDirection 'Up',
    },
    {
      key = 'j',
      mods = 'CTRL',
      action = act.ActivatePaneDirection 'Down',
    },

    -- rename current tab
    {
      key = 'r',
      mods = 'LEADER',
      action = act.PromptInputLine {
        description = 'Enter new name for tab',
        action = wezterm.action_callback(function(window, pane, line)
          -- line will be `nil` if they hit escape without entering anything
          -- An empty string if they just hit enter
          -- Or the actual line of text they wrote
          if line then
            window:active_tab():set_title(line)
          end
        end),
      },
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
end

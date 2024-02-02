local helpers = require 'helpers'
-- Pull in the wezterm API
local wezterm = require 'wezterm'

return function(config)
  wezterm.font = wezterm.font 'CaskaydiaMono Nerd Font Mono'

  config.tab_bar_at_bottom = false

  config.window_padding = {
    bottom = 0,
  }

  config.inactive_pane_hsb = {
    brightness = 0.6,
  }

  -- color scheme
  config.color_scheme = 'Ayu Dark (Gogh)'

  config.window_frame = {
    -- The overall background color of the tab bar when
    -- the window is focused
    active_titlebar_bg = '#0A0E14',

    -- The overall background color of the tab bar when
    -- the window is not focused
    inactive_titlebar_bg = '#0A0E14',
  }

  config.colors = {
    -- cursor text color should be white otherwise it's invisible in the vim color scheme
    cursor_fg = 'black',

    -- selection background should match the color scheme on nvim
    selection_bg = '#1c2b3a',

    tab_bar = {
      -- The color of the strip that goes along the top of the window
      -- (does not apply when fancy tab bar is in use)
      background = '#0A0E14',

      -- The active tab is the one that has focus in the window
      active_tab = {
        -- The color of the background area for the tab
        bg_color = '#0A0E14',

        -- The color of the text for the tab
        fg_color = 'white',

        -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
        -- label shown for this tab.
        -- The default is "Normal"
        intensity = 'Bold',

        -- Specify whether you want "None", "Single" or "Double" underline for
        -- label shown for this tab.
        -- The default is "None"
        underline = 'None',

        -- Specify whether you want the text to be italic (true) or not (false)
        -- for this tab.  The default is false.
        italic = false,

        -- Specify whether you want the text to be rendered with strikethrough (true)
        -- or not for this tab.  The default is false.
        strikethrough = false,
      },

      -- Inactive tabs are the tabs that do not have focus
      inactive_tab = {
        bg_color = '#0A0E14',
        fg_color = '#808080',
      },

      new_tab = {
        bg_color = '#0A0E14',
        fg_color = '#808080',

        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `new_tab`.
      },
    }
  }

  -- font size based on laptops
  if not helpers.is_windows() then
    config.font_size = 15.0
    config.window_frame.font_size = 14.0
  else
    config.font_size = 11.0
    config.window_frame.font_size = 10.0
  end
end

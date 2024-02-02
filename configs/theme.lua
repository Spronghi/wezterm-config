local helpers = require 'helpers'
-- Pull in the wezterm API
local wezterm = require 'wezterm'

return function(config)
  wezterm.font = wezterm.font 'CaskaydiaMono Nerd Font Mono'

  config.tab_bar_at_bottom = false

  config.window_padding = {
    bottom = 0,
  }

  -- color scheme
  config.color_scheme = 'Ayu Dark (Gogh)'
  config.colors = {
    cursor_fg = 'white',
  }
  -- font size based on laptops
  if not helpers.is_windows() then
    config.font_size = 15.0
  else
    config.font_size = 11.0
  end
end

local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "catppuccin-frappe"
config.font = wezterm.font "HackGen Console NF"
config.font_size = 13.4

config.hide_tab_bar_if_only_one_tab = true

config.disable_default_key_bindings = true
config.keys = require("keybind").keys

config.window_background_opacity = 0.75

return config

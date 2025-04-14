local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "catppuccin-frappe"
config.font = wezterm.font "Firple"

config.front_end = "WebGpu"

config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

config.disable_default_key_bindings = true
config.keys = require("keybind").keys

config.default_prog = { "pwsh" }

return config

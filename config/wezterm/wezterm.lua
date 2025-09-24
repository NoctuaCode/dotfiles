local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "tokyonight_night"
config.font_size = 14
config.font = wezterm.font("GeistMono Nerd Font Mono")
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}
config.enable_scroll_bar = false
config.enable_wayland = false
config.max_fps = 120
config.front_end = "WebGpu"
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"

return config

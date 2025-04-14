local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return {
	front_end = "WebGpu",
	webgpu_power_preference = "HighPerformance",

	window_decorations = "RESIZE",
	tab_bar_at_bottom = true,
	window_padding = {
		left = 15,
		right = 15,
		top = 15,
		bottom = 15,
	},
	window_close_confirmation = "NeverPrompt",

	color_scheme = "rose-pine",
	term = "xterm-256color",
	enable_tab_bar = true,

	font_size = 14,
	font = wezterm.font({ family = "Maple Mono" }),

	font_rules = {
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font({ family = "Maple Mono", weight = "Bold", style = "Italic" }),
		},
		{
			italic = true,
			intensity = "Half",
			font = wezterm.font({ family = "Maple Mono", weight = "Thin", style = "Italic" }),
		},
		{
			italic = true,
			intensity = "Normal",
			font = wezterm.font({ family = "Maple Mono", style = "Italic" }),
		},
	},

	use_dead_keys = false,
	scrollback_lines = 10000,

	default_prog = { "/opt/homebrew/bin/nu", "--config", "/Users/noctuapps/.config/nushell/config.nu" },
}

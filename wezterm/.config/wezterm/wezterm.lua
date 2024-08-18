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
	window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 10,
	},
	window_close_confirmation = "NeverPrompt",

	color_scheme = "rose-pine-moon",
	term = "xterm-256color",
	enable_tab_bar = false,

	font_size = 15,
	font = wezterm.font({ family = "BlexMono Nerd Font" }),
	bold_brightens_ansi_colors = true,
	adjust_window_size_when_changing_font_size = true,

	font_rules = {
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font({ family = "BlexMono Nerd Font", weight = "Bold", style = "Italic" }),
		},
		{
			italic = true,
			intensity = "Half",
			font = wezterm.font({ family = "BlexMono Nerd Font", weight = "DemiBold", style = "Italic" }),
		},
		{
			italic = true,
			intensity = "Normal",
			font = wezterm.font({ family = "BlexMono Nerd Font", style = "Italic" }),
		},
	},

	use_dead_keys = false,
	scrollback_lines = 10000,
}

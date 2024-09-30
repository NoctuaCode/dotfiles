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

	color_scheme = "cyberdream",
	-- term = "xterm-256color",
	enable_tab_bar = false,
	window_background_opacity = 0.8,

	font_size = 20,
	font = wezterm.font({ family = "DankMono Nerd Font" }),
	bold_brightens_ansi_colors = true,
	adjust_window_size_when_changing_font_size = true,

	font_rules = {
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font({ family = "DankMono Nerd Font", weight = "Bold", style = "Italic" }),
		},
		{
			italic = true,
			intensity = "Half",
			font = wezterm.font({ family = "DankMono Nerd Font", weight = "DemiBold", style = "Italic" }),
		},
		{
			italic = true,
			intensity = "Normal",
			font = wezterm.font({ family = "DankMono Nerd Font", style = "Italic" }),
		},
	},

	use_dead_keys = false,
	scrollback_lines = 10000,
}

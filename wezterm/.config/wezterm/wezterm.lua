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
		left = 10,
		right = 10,
		top = 10,
		bottom = 10,
	},
	window_close_confirmation = "NeverPrompt",

	color_scheme = "tokyonight",
	term = "xterm-256color",
	enable_tab_bar = false,
	-- window_background_opacity = 0.8,

	font_size = 18,
	font = wezterm.font({ family = "FiraCode Nerd Font" }),

	font_rules = {
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font({ family = "FiraCode Nerd Font", weight = "Bold", style = "Italic" }),
		},
		{
			italic = true,
			intensity = "Half",
			font = wezterm.font({ family = "FiraCode Nerd Font", weight = "DemiBold", style = "Italic" }),
		},
		{
			italic = true,
			intensity = "Normal",
			font = wezterm.font({ family = "FiraCode Nerd Font", style = "Italic" }),
		},
	},

	use_dead_keys = false,
	scrollback_lines = 10000,
}

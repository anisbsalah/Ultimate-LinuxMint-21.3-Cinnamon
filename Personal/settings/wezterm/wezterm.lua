-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Maximized window on start up
local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- -- Set startup window position
-- local mux = wezterm.mux
-- wezterm.on("gui-startup", function(cmd)
-- 	wezterm.mux.spawn_window({
-- 		position = {
-- 			x = 280,
-- 			y = 120,
-- 		},
-- 	})
-- end)

-- This is where you actually apply your config choices
return {

	-- General
	automatically_reload_config = true,
	inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
	window_close_confirmation = "NeverPrompt",

	-- Appearance
	window_background_opacity = 0.85,
	window_decorations = "TITLE | RESIZE",
	initial_cols = 80,
	initial_rows = 24,
	enable_tab_bar = true,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	enable_scroll_bar = true,
	scrollback_lines = 50000,

	-- Cursor
	default_cursor_style = "BlinkingBar",
	cursor_blink_rate = 750,
	cursor_thickness = "0.85pt",

	-- Fonts
	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 12.0,

	-- Colors
	color_scheme = "Arc-Dark",
	color_scheme_dirs = { "$HOME/.config/wezterm/colors" },
}

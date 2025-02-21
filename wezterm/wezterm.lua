local wezterm = require("wezterm")
local scheme = wezterm.get_builtin_color_schemes()["Bamboo"]
local config = {
	color_scheme = "Bamboo",
	color_scheme_dirs = { os.getenv("HOME") .. "/.config/wezterm/colors/" },
	-- use_fancy_tab_bar = false,
	exit_behavior = "CloseOnCleanExit",
	show_new_tab_button_in_tab_bar = false,
	colors = {
		tab_bar = {
			background = scheme.bg_trans,
			new_tab = { bg_color = "#B5D0C0", fg_color = scheme.ansi[8], intensity = "Bold" },
			new_tab_hover = { bg_color = scheme.ansi[1], fg_color = scheme.brights[8], intensity = "Bold" },
			active_tab = { bg_color = "#27850b", fg_color = "#FCE8C3" },
			inactive_tab = { bg_color = scheme.ansi[1], fg_color = "#FCE8C3" },
			inactive_tab_hover = { bg_color = scheme.ansi[2], fg_color = "#FCE8C3" },
		},
	},
}
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
	font = wezterm.font({ family = "JetBrainsMonoNerdFont", weight = "ExtraLight" }),
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
	-- font = font(font_primary, { bold = true }),
	font_size = 7,
}
config.font = wezterm.font("Maple Mono NF CN", { weight = "Light", stretch = "Normal", style = "Normal" })
config.font_size = 12

-- 默认 shell
config.default_prog = { "/usr/bin/fish" }

config.window_background_opacity = 0.74
config.window_padding = {
	left = 20,
	right = 20,
	top = 16,
	bottom = 2,
}
wezterm.on("toggle-opacity", function(window)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_background_opacity then
		-- if no override is setup, override the default opacity value with 1.0
		overrides.window_background_opacity = 1.0
	else
		-- if there is an override, make it nil so the opacity goes back to the default
		overrides.window_background_opacity = nil
	end
	window:set_config_overrides(overrides)
end)

config.keys = {
	{ key = "O", mods = "CTRL|SHIFT", action = wezterm.action.EmitEvent("toggle-opacity") },
}
config.enable_wayland = true
config.serial_ports = {
	{
		name = "/dev/ttyACM0",
		port = "/dev/ttyACM0", -- 替换为你的串口设备路径
		baud = 115200, -- 波特率，根据你的设备设置
	},
}
return config

local wezterm = require("wezterm")
local scheme = wezterm.get_builtin_color_schemes()["carbonfox"]
local config = {
	color_scheme = "carbonfox",
	color_scheme_dirs = { os.getenv("HOME") .. "/.config/wezterm/colors/" },
	-- use_fancy_tab_bar = false,
	exit_behavior = "CloseOnCleanExit",
	-- tab_bar_at_bottom = false,
	colors = {
		tab_bar = {
			background = scheme.background,
			new_tab = { bg_color = "#2e3440", fg_color = scheme.ansi[8], intensity = "Bold" },
			new_tab_hover = { bg_color = scheme.ansi[1], fg_color = scheme.brights[8], intensity = "Bold" },
			-- format-tab-title
			-- active_tab = { bg_color = "#121212", fg_color = "#FCE8C3" },
			-- inactive_tab = { bg_color = scheme.background, fg_color = "#FCE8C3" },
			-- inactive_tab_hover = { bg_color = scheme.ansi[1], fg_color = "#FCE8C3" },
		},
	},
}
-- config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
	font = wezterm.font({ family = "JetBrainsMonoNerdFontMono", weight = "ExtraLight" }),
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}
-- 字体配置
-- wezterm.font_with_fallback({
-- 	"LXGWWenKaiMono",
-- })
config.font = wezterm.font("Maple Mono NF CN", { weight = "Light", stretch = "Normal", style = "Normal" })
config.font_size = 12

-- 默认 shell
config.default_prog = { "/usr/bin/fish" }

config.window_background_opacity = 0.6
config.window_padding = {
	left = 24,
	right = 24,
	top = 16,
	bottom = 16,
}
wezterm.on("toggle-opacity", function(window, pane)
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

return config

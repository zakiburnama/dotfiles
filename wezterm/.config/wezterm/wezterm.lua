-- Converted from kitty.conf + current-theme.conf (Catppuccin-Mocha)
-- kitty had no build for native Windows; WezTerm replaces it here.

local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Default shell: PowerShell instead of cmd.exe, so Starship (prompt theme,
-- config at starship/.config/starship.toml in this dotfiles repo) has a
-- shell it actually supports. cmd.exe has no real Starship support.
config.default_prog = { "powershell.exe", "-NoLogo" }

-- Font (kitty.conf: font_family / bold_font / italic_font / bold_italic_font)
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12

-- Theme colors below are managed by apply-theme.ps1 (see ahk/quickmenu
-- repo) -- keep the BEGIN/END marker lines intact; everything between them
-- gets replaced wholesale when a theme is applied from QuickMenu Light.
-- BEGIN THEME COLORS
-- Catppuccin-Mocha, ported 1:1 from current-theme.conf
config.colors = {
	foreground = "#CDD6F4",
	background = "#1E1E2E",

	cursor_bg = "#F5E0DC",
	cursor_fg = "#1E1E2E",
	cursor_border = "#F5E0DC",

	selection_fg = "#1E1E2E",
	selection_bg = "#F5E0DC",

	split = "#B4BEFE",
	visual_bell = "#F9E2AF",

	ansi = {
		"#45475A", -- black
		"#F38BA8", -- red
		"#A6E3A1", -- green
		"#F9E2AF", -- yellow
		"#89B4FA", -- blue
		"#F5C2E7", -- magenta
		"#94E2D5", -- cyan
		"#BAC2DE", -- white
	},
	brights = {
		"#585B70", -- bright black
		"#F38BA8", -- bright red
		"#A6E3A1", -- bright green
		"#F9E2AF", -- bright yellow
		"#89B4FA", -- bright blue
		"#F5C2E7", -- bright magenta
		"#94E2D5", -- bright cyan
		"#A6ADC8", -- bright white
	},

	tab_bar = {
		background = "#11111B",
		active_tab = {
			bg_color = "#CBA6F7",
			fg_color = "#11111B",
		},
		inactive_tab = {
			bg_color = "#181825",
			fg_color = "#CDD6F4",
		},
		inactive_tab_hover = {
			bg_color = "#313244",
			fg_color = "#CDD6F4",
		},
		new_tab = {
			bg_color = "#11111B",
			fg_color = "#CDD6F4",
		},
	},
}
-- END THEME COLORS
-- kitty's mark1/mark2/mark3 colors (kitty's text-marking feature) have no
-- WezTerm equivalent and were skipped.

-- Opacity: kitty.conf has `background_opacity 0.85` commented out, so kitty
-- currently runs fully opaque. Mirrored as-is; uncomment to enable.
config.window_background_opacity = 1.0
-- config.window_background_opacity = 0.85

-- kitty's default window padding is 0 and was never overridden here.
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Tab bar: kitty renders a flat single-line bar (not OS-native chrome).
-- use_fancy_tab_bar = false gets the closest look in WezTerm.
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false

-- Keybindings: kitty.conf had no active custom keymaps (the one entry,
-- ctrl+shift+t -> ~/bin/toggle-kitty-opacity.sh, was commented out and
-- Linux-only anyway), so WezTerm's defaults are used as-is. Add overrides
-- here as needed:
config.keys = {}

return config

-- Converted from kitty.conf + current-theme.conf (Catppuccin-Mocha)
-- kitty had no build for native Windows; WezTerm replaces it here.

local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Start maximized -- there's no plain config option for this, has to be
-- done by hooking the gui-startup event and maximizing the window it
-- creates. Applies to every new WezTerm window, not just the first.
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- Default shell: PowerShell instead of cmd.exe, so Starship (prompt theme,
-- config at starship/.config/starship.toml in this dotfiles repo) has a
-- shell it actually supports. cmd.exe has no real Starship support.
config.default_prog = { "powershell.exe", "-NoLogo" }

-- Font (kitty.conf: font_family / bold_font / italic_font / bold_italic_font)
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12

-- Theme colors (and window_background_opacity, since transparency is
-- theme-specific too -- vague is transparent, everything else isn't)
-- below are managed by apply-theme.ps1 (see ahk/quickmenu repo) -- keep
-- the BEGIN/END marker lines intact; everything between them gets
-- replaced wholesale when a theme is applied from QuickMenu Light.
-- BEGIN THEME COLORS
-- Vague (vague2k/vague.nvim palette, ported 1:1) -- the one theme here
-- that runs transparent (window_background_opacity below), so the
-- wallpaper shows through.
config.colors = {
	foreground = "#CDCDCD",
	background = "#141415",

	cursor_bg = "#7E98E8",
	cursor_fg = "#141415",
	cursor_border = "#7E98E8",

	selection_fg = "#CDCDCD",
	selection_bg = "#333738",

	split = "#878787",
	visual_bell = "#F3BE7C",

	ansi = {
		"#141415", -- black
		"#D8647E", -- red
		"#7FA563", -- green
		"#F3BE7C", -- yellow
		"#6E94B2", -- blue
		"#BB9DBD", -- magenta
		"#9BB4BC", -- cyan
		"#CDCDCD", -- white
	},
	brights = {
		"#606079", -- bright black
		"#D8647E", -- bright red
		"#7FA563", -- bright green
		"#F3BE7C", -- bright yellow
		"#7E98E8", -- bright blue
		"#AEAED1", -- bright magenta
		"#B4D4CF", -- bright cyan
		"#CDCDCD", -- bright white
	},

	tab_bar = {
		background = "#1C1C24",
		active_tab = {
			bg_color = "#7E98E8",
			fg_color = "#141415",
		},
		inactive_tab = {
			bg_color = "#252530",
			fg_color = "#606079",
		},
		inactive_tab_hover = {
			bg_color = "#333738",
			fg_color = "#CDCDCD",
		},
		new_tab = {
			bg_color = "#1C1C24",
			fg_color = "#606079",
		},
	},
}
config.window_background_opacity = 0.85
-- END THEME COLORS
-- kitty's mark1/mark2/mark3 colors (kitty's text-marking feature) have no
-- WezTerm equivalent and were skipped.

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

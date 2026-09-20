-- Classic DMG Game Boy 4-shade green, matching QuickMenu Light's own
-- game_boy theme (ahk/quickmenu repo) 1:1. Hand-written rather than an
-- installed plugin -- no existing Neovim colorscheme matches this exact
-- monochrome look, and this avoids adding a plugin dependency just for
-- one theme. Managed by QuickMenu Light's global theme switcher; see that
-- repo's README.md ("Global themes") for how/why.
--
-- Unlike the other custom themes here, this one is background=light: the
-- real DMG screen is a light, slightly yellow-green reflective LCD with
-- DARK pixels, not the other way around.

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.o.background = "light"
vim.g.colors_name = "game_boy"

-- The 4 canonical DMG shades, lightest to darkest.
local lightest = "#9BBC0F" -- screen background
local light = "#8BAC0F"
local dark = "#306230"
local darkest = "#0F380F" -- pixels/text

local bg = lightest
local bg_alt = light
local fg = darkest
local fg_dim = dark
local fg_bright = darkest
local sel_bg = darkest
local sel_fg = lightest

local function hl(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- Editor chrome
hl("Normal", { fg = fg, bg = bg })
hl("NormalFloat", { fg = fg, bg = bg_alt })
hl("NormalNC", { fg = fg, bg = bg })
hl("Cursor", { fg = bg, bg = fg })
hl("CursorLine", { bg = bg_alt })
hl("CursorLineNr", { fg = fg, bg = bg_alt, bold = true })
hl("LineNr", { fg = fg_dim })
hl("Visual", { fg = sel_fg, bg = sel_bg })
hl("VisualNOS", { fg = sel_fg, bg = sel_bg })
hl("Search", { fg = sel_fg, bg = sel_bg })
hl("IncSearch", { fg = bg, bg = fg_bright })
hl("CurSearch", { fg = bg, bg = fg_bright })
hl("Pmenu", { fg = fg, bg = bg_alt })
hl("PmenuSel", { fg = sel_fg, bg = sel_bg })
hl("PmenuSbar", { bg = bg_alt })
hl("PmenuThumb", { bg = fg_dim })
hl("StatusLine", { fg = sel_fg, bg = sel_bg })
hl("StatusLineNC", { fg = fg_dim, bg = bg_alt })
hl("TabLine", { fg = fg_dim, bg = bg_alt })
hl("TabLineFill", { bg = bg_alt })
hl("TabLineSel", { fg = sel_fg, bg = sel_bg })
hl("WinSeparator", { fg = fg_dim })
hl("VertSplit", { fg = fg_dim })
hl("SignColumn", { fg = fg_dim, bg = bg })
hl("FoldColumn", { fg = fg_dim, bg = bg })
hl("Folded", { fg = fg_dim, bg = bg_alt })

-- Diff
hl("DiffAdd", { fg = fg, bg = bg_alt })
hl("DiffChange", { fg = fg, bg = bg_alt })
hl("DiffDelete", { fg = fg_dim, bg = bg })
hl("DiffText", { fg = sel_fg, bg = sel_bg, bold = true })

-- Diagnostics -- no real "alarm" color available in a 2-hue palette, so
-- error/warn lean on bold+undercurl for emphasis instead of hue.
hl("DiagnosticError", { fg = fg_bright, bold = true, undercurl = true })
hl("DiagnosticWarn", { fg = fg_bright, undercurl = true })
hl("DiagnosticInfo", { fg = fg_dim })
hl("DiagnosticHint", { fg = fg_dim })

-- Syntax (classic groups)
hl("Comment", { fg = fg_dim, italic = true })
hl("Constant", { fg = fg })
hl("String", { fg = fg_bright })
hl("Character", { fg = fg_bright })
hl("Number", { fg = fg })
hl("Boolean", { fg = fg, bold = true })
hl("Float", { fg = fg })
hl("Identifier", { fg = fg })
hl("Function", { fg = fg_bright, bold = true })
hl("Statement", { fg = fg_bright, bold = true })
hl("Conditional", { fg = fg_bright, bold = true })
hl("Repeat", { fg = fg_bright, bold = true })
hl("Label", { fg = fg })
hl("Operator", { fg = fg_dim })
hl("Keyword", { fg = fg_bright, bold = true })
hl("Exception", { fg = fg_bright, bold = true })
hl("PreProc", { fg = fg })
hl("Include", { fg = fg })
hl("Define", { fg = fg })
hl("Macro", { fg = fg })
hl("PreCondit", { fg = fg })
hl("Type", { fg = fg })
hl("StorageClass", { fg = fg, bold = true })
hl("Structure", { fg = fg })
hl("Typedef", { fg = fg })
hl("Special", { fg = fg_bright })
hl("SpecialChar", { fg = fg_bright })
hl("Tag", { fg = fg_bright })
hl("Delimiter", { fg = fg_dim })
hl("SpecialComment", { fg = fg_dim, italic = true, bold = true })
hl("Debug", { fg = fg_bright })
hl("Underlined", { fg = fg, underline = true })
hl("Ignore", { fg = fg_dim })
hl("Error", { fg = bg, bg = fg_bright, bold = true })
hl("Todo", { fg = bg, bg = fg_bright, bold = true })

-- Treesitter captures (LazyVim leans on these heavily; classic groups
-- above are the fallback for anything not covered here)
hl("@variable", { fg = fg })
hl("@variable.builtin", { fg = fg, bold = true })
hl("@function", { fg = fg_bright, bold = true })
hl("@function.builtin", { fg = fg_bright, bold = true })
hl("@keyword", { fg = fg_bright, bold = true })
hl("@keyword.function", { fg = fg_bright, bold = true })
hl("@keyword.return", { fg = fg_bright, bold = true })
hl("@string", { fg = fg_bright })
hl("@comment", { fg = fg_dim, italic = true })
hl("@type", { fg = fg })
hl("@type.builtin", { fg = fg })
hl("@constant", { fg = fg })
hl("@constant.builtin", { fg = fg, bold = true })
hl("@operator", { fg = fg_dim })
hl("@punctuation.bracket", { fg = fg_dim })
hl("@punctuation.delimiter", { fg = fg_dim })
hl("@property", { fg = fg })
hl("@field", { fg = fg })
hl("@parameter", { fg = fg })
hl("@tag", { fg = fg_bright })
hl("@tag.attribute", { fg = fg })
hl("@boolean", { fg = fg, bold = true })
hl("@number", { fg = fg })

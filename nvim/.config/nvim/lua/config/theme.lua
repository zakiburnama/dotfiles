local themes = {
  "tokyonight",
  "gruvbox",
  "catppuccin",
  "rose-pine",
  "vague",
}

local state_file = vim.fn.stdpath("config") .. "/theme.txt"

-- Read last used theme
local function read_last_theme()
  local f = io.open(state_file, "r")
  if f then
    local name = f:read("*a")
    f:close()
    for _, theme in ipairs(themes) do
      if theme == name then
        return name
      end
    end
  end
  return themes[1] -- fallback
end

-- Save theme to file
local function save_theme(name)
  local f = io.open(state_file, "w")
  if f then
    f:write(name)
    f:close()
  end
end

-- Apply the selected theme
local function set_theme(name)
  vim.cmd("colorscheme " .. name)
  vim.notify("Theme set to " .. name, vim.log.levels.INFO)
  save_theme(name)
end

-- Show menu
local function select_theme()
  vim.ui.select(themes, {
    prompt = "Select a colorscheme",
    format_item = function(item)
      return "🎨 " .. item
    end,
  }, function(choice)
    if choice then
      set_theme(choice)
    end
  end)
end

-- Load theme at startup
set_theme(read_last_theme())

-- Create command
vim.api.nvim_create_user_command("SelectTheme", select_theme, {})

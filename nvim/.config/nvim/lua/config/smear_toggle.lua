--
local smear = require("smear_cursor")
--
local state_file = vim.fn.stdpath("cache") .. "/smear_state.txt"
--
-- save state
local function save_state(value)
  local f = io.open(state_file, "w")
  if f then
    f:write(value)
    f:close()
  end
end
--
-- read state
local function read_state()
  local f = io.open(state_file, "r")
  if f then
    local n = f:read("*n")
    f:close()
    -- return n == 1
    if n == 1 then
      return true
    end
    return false
  end
  return true
end
--
-- start smear is true
if read_state() then
  smear.setup({
    cursor_color = "#ff8800",
    stiffness = 0.3,
    trailing_stiffness = 0.1,
    trailing_exponent = 5,
    never_draw_over_target = true,
    hide_target_hack = true,
    gamma = 1,
    time_interval = 7, -- milliseconds
  })
end
--
--
-- smear.setup({
--   cursor_color = "#ff8800",
--   stiffness = 0.3,
--   trailing_stiffness = 0.1,
--   trailing_exponent = 5,
--   never_draw_over_target = true,
--   hide_target_hack = true,
--   gamma = 1,
--   time_interval = 7, -- milliseconds
-- })
--
-- toggle on and off
vim.api.nvim_create_user_command("ToggleSmear", function()
  -- smear.toggle()
  local is_on = read_state()
  -- local is_on = true
  if is_on then
    smear.toggle() -- turn OFF
    save_state(0)
    vim.notify("🧊 Smear OFF", vim.log.levels.INFO)
  else
    smear.toggle() -- turn ON
    save_state(1)
    vim.notify("🔥 Smear ON", vim.log.levels.INFO)
  end
end, {})

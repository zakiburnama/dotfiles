--
local M = {}
local value = {}
local state_file = vim.fn.stdpath("cache") .. "/smear_state.txt"
-- local file = vim.fn.stdpath("cache") .. "/smear_state.txt"

local function write_state(n)
  -- n = "1"
  local f = io.open(state_file, "w")
  if f then
    f:write(n)
    f:close()
  end
end

local function read_state()
  local f = io.open(state_file, "r")
  -- local g = io.open(file, "r")
  if f then
    -- local content = f:read("*l")
    value = f:read("*l")
    -- st = "0"
    -- f:close()
    f:close()
    -- -- Trim whitespace (just in case)
    -- local value = tonumber(content:match("^%s*(.-)%s*$"))
    -- if value == "wadaw" then
    if value == "0" then
      Smear_off()
      -- require("smear_cursor").setup({
      --   -- Smear cursor when switching buffers or windows.
      --   smear_between_buffers = false,
      --   -- Smear cursor when moving within line or to neighbor lines.
      --   -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
      --   smear_between_neighbor_lines = false,
      --   -- Draw the smear in buffer space instead of screen space when scrolling
      --   scroll_buffer_space = false,
      --   -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
      --   -- Smears will blend better on all backgrounds.
      --   legacy_computing_symbols_support = false,
      --   -- Smear cursor in insert mode.
      --   -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
      --   smear_insert_mode = false,
      -- })
      -- vim.notify("Smear Cursor: OFF", vim.log.levels.INFO)
    else
      Smear_on()
      -- require("smear_cursor").setup({
      --   cursor_color = "#ff8800",
      --   stiffness = 0.3,
      --   trailing_stiffness = 0.1,
      --   trailing_exponent = 5,
      --   never_draw_over_target = true,
      --   hide_target_hack = true,
      --   gamma = 1,
      --   time_interval = 7, -- milliseconds
      -- })
      -- vim.notify("Smear Cursor: ON", vim.log.levels.INFO)
    end
  else
    Smear_off()
    -- vim.cmd("highlight! Cursor guifg=NONE guibg=white") -- fallback
    -- vim.api.nvim_clear_autocmds({ group = "smear_cursor" })
    -- vim.notify("Smear Cursor: OFF", vim.log.levels.INFO)
  end
end

function Smear_on()
  require("smear_cursor").setup({
    cursor_color = "#ff8800",
    stiffness = 0.3,
    trailing_stiffness = 0.1,
    trailing_exponent = 5,
    never_draw_over_target = true,
    hide_target_hack = true,
    gamma = 1,
    time_interval = 7, -- milliseconds
  })
  vim.notify("Smear Cursor: ON", vim.log.levels.INFO)
end

function Smear_off()
  require("smear_cursor").setup({
    -- Smear cursor when switching buffers or windows.
    smear_between_buffers = false,
    -- Smear cursor when moving within line or to neighbor lines.
    -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
    smear_between_neighbor_lines = false,
    -- Draw the smear in buffer space instead of screen space when scrolling
    scroll_buffer_space = false,
    -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
    -- Smears will blend better on all backgrounds.
    legacy_computing_symbols_support = false,
    -- Smear cursor in insert mode.
    -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
    smear_insert_mode = false,
  })
  vim.notify("Smear Cursor: OFF", vim.log.levels.INFO)
end

-- toggle function
function M.toggle()
  if value == "0" then
    vim.notify("Smear Cursor: ON", vim.log.levels.INFO)
    write_state("1")
    -- M.disable()
  else
    vim.notify("Smear Cursor: OFF", vim.log.levels.INFO)
    write_state("0")
    -- M.enable()
  end
end

-- init at startup
function M.init()
  -- if value == "1" then
  --   write_state("1")
  --   -- vim.schedule(function()
  --   --   M.enable()
  --   -- end)
  -- end
  -- write_state("0")
  read_state()
end

-- write_state()
-- read_state()

return M

--
-- local M = {}
--
-- local state_file = vim.fn.stdpath("data") .. "/smear_state.txt"
-- local enabled = false
--
-- -- Check if file exists and read the state
-- local function load_state()
--   local ok, f = pcall(io.open, state_file, "r")
--   if ok and f then
--     local content = f:read("*a")
--     f:close()
--     enabled = content:match("1") ~= nil
--   else
--     enabled = false
--   end
-- end
--
-- -- Write state to file
-- local function save_state()
--   local ok, f = pcall(io.open, state_file, "w")
--   if ok and f then
--     f:write(enabled and "1" or "0")
--     f:close()
--   end
-- end
--
-- -- Smear setup
-- function M.enable()
--   local smear = require("smear_cursor")
--   smear.setup({
--     cursor_color = "#ff8800",
--     stiffness = 0.3,
--     trailing_stiffness = 0.1,
--     trailing_exponent = 5,
--     never_draw_over_target = true,
--     hide_target_hack = true,
--     gamma = 1,
--   })
--   enabled = true
--   save_state()
--   vim.notify("Smear: ON")
-- end
--
-- -- Smear disable
-- function M.disable()
--   vim.cmd("highlight! Cursor guifg=NONE guibg=white")
--
--   -- Check if autocommand group exists
--   local exists = pcall(function()
--     vim.api.nvim_get_autocmds({ group = "smear_cursor" })
--   end)
--
--   if exists then
--     vim.api.nvim_clear_autocmds({ group = "smear_cursor" })
--   end
--
--   enabled = false
--   save_state()
--   vim.notify("Smear: OFF")
-- end
--
-- -- toggle function
-- function m.toggle()
--   if enabled then
--     m.disable()
--   else
--     m.enable()
--   end
-- end
--
-- -- init at startup
-- function m.init()
--   load_state()
--   if enabled then
--     vim.schedule(function()
--       m.enable()
--     end)
--   end
-- end
--
-- return M

-- local M = {}
-- local enabled = false
--
-- function M.toggle()
--   if enabled then
--     vim.cmd("highlight! Cursor guifg=NONE guibg=white") -- fallback
--     vim.api.nvim_clear_autocmds({ group = "smear_cursor" })
--     enabled = false
--     vim.notify("Smear Cursor: OFF", vim.log.levels.INFO)
--   else
--     require("smear_cursor").setup({
--       cursor_color = "#ff8800",
--       stiffness = 0.3,
--       trailing_stiffness = 0.1,
--       trailing_exponent = 5,
--       never_draw_over_target = true,
--       hide_target_hack = true,
--       gamma = 1,
--     })
--     enabled = true
--     vim.notify("Smear Cursor: ON", vim.log.levels.INFO)
--   end
-- end

-- return M

-- local M = {}
-- local smear = require("smear_cursor")
-- local state_file = vim.fn.stdpath("data") .. "/smear_state.txt"
--
-- local function read_state()
--   local f = io.open(state_file, "r")
--   if not f then
--     return false
--   end
--   local content = f:read("*a")
--   f:close()
--   return content:match("1") ~= nil
-- end
--
-- local function write_state(on)
--   local f = io.open(state_file, "w")
--   if f then
--     f:write(on and "1" or "0")
--     f:close()
--   end
-- end
--
-- M.enabled = read_state()
--
-- function M.enable()
--   smear.setup()
--   M.enabled = true
--   write_state(true)
--   vim.notify("Smear cursor enabled")
-- end
--
-- function M.disable()
--   vim.api.nvim_clear_autocmds({ group = "smear_cursor", force = true })
--   vim.cmd([[hi Cursor guibg=NONE guifg=NONE]])
--   M.enabled = false
--   write_state(false)
--   vim.notify("Smear cursor disabled")
-- end
--
-- function M.toggle()
--   if M.enabled then
--     M.disable()
--   else
--     M.enable()
--   end
-- end
--
-- function M.init()
--   if M.enabled then
--     M.enable()
--   end
-- end
--
-- return M

-- -- ~/.config/nvim/lua/config/smear.lua
-- local M = {}
-- local state_file = vim.fn.stdpath("data") .. "/smear_state.txt"
-- local augroup_name = "SmearCursorToggle"
--
-- -- Read current state from file
-- local function read_state()
--   local f = io.open(state_file, "r")
--   if f then
--     local content = f:read("*a")
--     f:close()
--     return content:match("1") ~= nil
--   end
--   return false
-- end
--
-- -- Write current state to file
-- local function write_state(is_enabled)
--   local f = io.open(state_file, "w")
--   if f then
--     f:write(is_enabled and "1" or "0")
--     f:close()
--   end
-- end
--
-- -- Enable smear
-- local function enable()
--   require("smear_cursor").setup()
--   write_state(true)
--   vim.notify("Smear effect enabled", vim.log.levels.INFO)
-- end
--
-- -- Disable smear by clearing the augroup
-- local function disable()
--   pcall(vim.api.nvim_clear_autocmds, { group = augroup_name })
--   write_state(false)
--   vim.cmd([[hi Cursor guibg=NONE guifg=NONE]]) -- reset fallback
--   vim.notify("Smear effect disabled", vim.log.levels.INFO)
-- end
--
-- -- Toggle logic
-- M.toggle = function()
--   local is_enabled = read_state()
--   if is_enabled then
--     disable()
--   else
--     enable()
--   end
-- end
--
-- -- Automatically restore last state
-- M.init = function()
--   if read_state() then
--     enable()
--   end
-- end
--
-- return M

-- local M = {}
-- local enabled = false
-- local state_file = vim.fn.stdpath("data") .. "/smear_state.txt"
--
-- local function save_state()
--   local f = io.open(state_file, "w")
--   if f then
--     f:write(enabled and "1" or "0")
--     f:close()
--   end
-- end
--
-- local function load_state()
--   local f = io.open(state_file, "r")
--   if f then
--     local content = f:read("*a")
--     f:close()
--     enabled = content == "1"
--   end
-- end
--
-- function M.toggle()
--   enabled = not enabled
--   if enabled then
--     require("smear_cursor").setup({
--       cursor_color = "#ff8800",
--       stiffness = 0.3,
--       trailing_stiffness = 0.1,
--       trailing_exponent = 5,
--       never_draw_over_target = true,
--       hide_target_hack = true,
--       gamma = 1,
--     })
--     vim.notify("Smear Cursor: ON", vim.log.levels.INFO)
--   else
--     vim.cmd("highlight! Cursor guifg=NONE guibg=white") -- reset
--     vim.api.nvim_clear_autocmds({ group = "smear_cursor" })
--     vim.notify("Smear Cursor: OFF", vim.log.levels.INFO)
--   end
--   save_state()
-- end
--
-- function M.init()
--   load_state()
--   if enabled then
--     require("smear_cursor").setup({
--       cursor_color = "#ff8800",
--       stiffness = 0.3,
--       trailing_stiffness = 0.1,
--       trailing_exponent = 5,
--       never_draw_over_target = true,
--       hide_target_hack = true,
--       gamma = 1,
--     })
--   end
-- end
--
-- return M

--
-- local M = {}
--
-- local enabled = false
-- local smear = require("smear_cursor")
--
-- function M.toggle()
--   if enabled then
--     smear.disable()
--     vim.notify("Smear Cursor Disabled", vim.log.levels.INFO)
--   else
--     smear.enable()
--     vim.notify("Smear Cursor Enabled", vim.log.levels.INFO)
--   end
--   enabled = not enabled
-- end
--
-- return M

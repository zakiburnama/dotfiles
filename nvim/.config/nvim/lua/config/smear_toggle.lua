local smear = require("smear_cursor")

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

vim.api.nvim_create_user_command("ToggleSmear", function()
  smear.toggle()
end, {})

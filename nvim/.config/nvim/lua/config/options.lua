-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.winbar = "%=%m %f"

-- Windows has no $HOME by default (uses %USERPROFILE%); some plugins
-- (e.g. floatingtodo.nvim) call os.getenv("HOME") directly and break without it.
if vim.fn.has("win32") == 1 and vim.env.HOME == nil then
  vim.env.HOME = vim.env.USERPROFILE
end

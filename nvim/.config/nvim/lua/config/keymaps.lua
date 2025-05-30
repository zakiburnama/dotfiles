-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)

-- vim.keymap.set("n", "<leader>u1", ":SelectTheme<CR>", { desc = "Toggle Theme" })

vim.keymap.set("n", "<leader>u2", "<cmd>ToggleTransparency<CR>", { desc = "Toggle Transparency" })

vim.keymap.set("n", "<leader>z1", ":VimBeGood<CR>", { desc = "Play VimBeGood" })

vim.keymap.set("n", "<leader>u3", function()
  require("config.smear").toggle()
end, { desc = "Toggle Smear Cursor" })

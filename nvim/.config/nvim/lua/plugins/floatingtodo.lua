return {
  "vimichael/floatingtodo.nvim",
  config = function()
    require("floatingtodo").setup({
      -- target_file = "~/notes/todo.md",
      target_file = vim.fn.has("win32") == 1
          and "C:/Users/ThinkPad/Documents/Obsidian-Vault/Z0002TODO/TODO.md"
        or "~/notes/TODO/TODO.md",
      width = 0.9,
      position = "center",
    })
    vim.keymap.set("n", "<leader>td", ":Td<CR>", { silent = true })
  end,
}

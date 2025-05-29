return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    -- @type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      --
      -- bigfile = { enabled = false },
      -- dashboard = { enabled = true },
      dashboard =
        -- @class snacks.dashboard.Config
        -- @field enabled? boolean
        -- @field sections snacks.dashboard.Section
        -- @field formats table<string, snacks.dashboard.Text|fun(item:snacks.dashboard.Item, ctx:snacks.dashboard.Format.ctx):snacks.dashboard.Text>
        {
          enabled = true,
          -- width = 60,
          -- row = nil, -- dashboard position. nil for center
          -- col = nil, -- dashboard position. nil for center
          -- pane_gap = 4, -- empty columns between vertical panes
          -- autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
          --
          --
          -- -- These settings are used by some built-in sections
          --           preset = {
          --             -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
          --             ---@type fun(cmd:string, opts:table)|nil
          --             pick = nil,
          --             -- Used by the `keys` section to show keymaps.
          --             -- Set your custom keymaps here.
          --             -- When using a function, the `items` argument are the default keymaps.
          --             ---@type snacks.dashboard.Item[]
          --             keys = {
          --               { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          --               { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          --               { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          --               { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          --               {
          --                 icon = " ",
          --                 key = "c",
          --                 desc = "Config",
          --                 action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          --               },
          --               { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          --               { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          --               { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          --             },
          --             -- Used by the `header` section
          --             header = [[
          -- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
          -- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
          -- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
          -- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
          -- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
          -- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
          --           },
          --
          --
          -- -- item field formatters
          -- formats = {
          --   icon = function(item)
          --     if item.file and item.icon == "file" or item.icon == "directory" then
          --       return M.icon(item.file, item.icon)
          --     end
          --     return { item.icon, width = 2, hl = "icon" }
          --   end,
          --   footer = { "%s", align = "center" },
          --   header = { "%s", align = "center" },
          --   file = function(item, ctx)
          --     local fname = vim.fn.fnamemodify(item.file, ":~")
          --     fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
          --     if #fname > ctx.width then
          --       local dir = vim.fn.fnamemodify(fname, ":h")
          --       local file = vim.fn.fnamemodify(fname, ":t")
          --       if dir and file then
          --         file = file:sub(-(ctx.width - #dir - 2))
          --         fname = dir .. "/…" .. file
          --       end
          --     end
          --     local dir, file = fname:match("^(.*)/(.+)$")
          --     return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
          --   end,
          -- },
          --
          --
          --
          --
          sections = {
            {
              pane = 1,
              { section = "terminal", cmd = "fortune -s | cowsay", hl = "header", padding = 1, indent = 8 },
              {
                section = "terminal",
                cmd = "ascii-image-converter ~/Pictures/Wallpaper/ae86.jpg -C --color-bg --width=57",
                height = 15,
                -- hl = "header",
                -- random = 10,
                padding = 1,
                -- indent = 8,
              },
              { section = "startup", padding = 1 },
              -- { section = "header" },
            },
            {
              pane = 2,
              { section = "keys", gap = 1, padding = 1 },
              { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = { 2, 2 } },
              { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
            },
          },
        },
      -- explorer = { enabled = false },
      -- indent = { enabled = false },
      -- input = { enabled = false },
      -- picker = { enabled = false },
      -- notifier = { enabled = false },
      -- quickfile = { enabled = false },
      -- scope = { enabled = false },
      -- scroll = { enabled = false },
      -- statuscolumn = { enabled = false },
      -- words = { enabled = false },
      --
    },
  },
}

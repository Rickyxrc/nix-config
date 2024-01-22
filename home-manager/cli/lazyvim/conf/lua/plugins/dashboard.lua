return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require('dashboard').setup {
      theme = "hyper",
      config = {
        week_header = {
          enable = true,
        },
        shortcut = {
          { desc = "Update Plugins", group = "@property", action = "Lazy update", key = "u" },
          { desc = "Restore Last Session", group = "@property", action = "lua require(\"persistence\").load({last = true})", key = "r" },
        }
      }
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}

return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require('dashboard').setup {
      theme = "hyper",
      config = {
        -- TODO: make this header useable
        dashboard_custom_header = {
          ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
          ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
          ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
          ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
          ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
          ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
        },
        shortcut = {
          { desc = "Update Plugins", group = "@property", action = "Lazy update", key = "u" },
          { desc = "Restore Last Session", group = "@property", action = "lua require(\"persistence\").load({last = true})", key = "r" },
          { desc = "Close Session", group = "@property", action = "q", key = "q" },
        }
      }
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}

return {
  "neovim/nvim-lspconfig",
  event = "VimEnter",
  dependencies = {
    { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
    { "folke/neodev.nvim", opts = {} },
    -- "mason.nvim",
    -- "williamboman/mason-lspconfig.nvim",
  },
  ---@class PluginLspOpts
  opts = {
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = {
        spacing = 2,
        source = "if_many",
        prefix = "-",
        -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
        -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
        -- prefix = "icons",
      },
      severity_sort = true,
    },
    servers = {
      -- pyright will be automatically installed with mason and loaded with lspconfig
    },
  }
}

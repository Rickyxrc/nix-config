-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
    ['ast-grep'] = {},
    ['lua-ls'] = {},
  },
}

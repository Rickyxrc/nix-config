-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup {}
lspconfig.ast_grep.setup {}
lspconfig.lua_ls.setup {}
lspconfig.nil_ls.setup {}

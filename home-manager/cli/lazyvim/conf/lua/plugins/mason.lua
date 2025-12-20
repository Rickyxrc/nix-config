return {
    "mason.nvim",
    enabled = true,
    opts = {
        ensure_installed = {
            "lua-language-server",
            "pyright",
            "pylint",
            "shfmt",
            "deno",
            "json-lsp",
            "omnisharp",
            "ast-grep",
        },
    },
}

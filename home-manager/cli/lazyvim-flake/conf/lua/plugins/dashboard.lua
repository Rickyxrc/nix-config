return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {
				header = {
					" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
					" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
					" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
					" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
					" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
					" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
				},
				center = {
					{
						action = "lua LazyVim.pick()()",
						desc = " Find File",
						icon = " ",
						key = "f",
					},
					{
						action = "ene | startinsert",
						desc = " New File",
						icon = " ",
						key = "n",
					},
					{
						action = 'lua LazyVim.pick("oldfiles")()',
						desc = " Recent Files",
						icon = " ",
						key = "r",
					},
					{
						action = 'lua LazyVim.pick("live_grep")()',
						desc = " Find Text",
						icon = " ",
						key = "g",
					},
					{
						action = "lua LazyVim.pick.config_files()()",
						desc = " Config",
						icon = " ",
						key = "c",
					},
					{
						action = 'lua require("persistence").load()',
						desc = " Restore Session",
						icon = " ",
						key = "s",
					},
					{
						action = function()
							vim.api.nvim_input("<cmd>qa<cr>")
						end,
						desc = " Quit",
						icon = " ",
						key = "q",
					},

					-- { desc = "Update Plugins", group = "@property", action = "Lazy update", key = "u" },
					-- { desc = "Restore Last Session", group = "@property", action = "lua require(\"persistence\").load({last = true})", key = "r" },
					-- { dec = "Close Session", group = "@property", action = "q", key = "q" },
				},
				footer = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
				end,
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}

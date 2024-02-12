-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local unmap = vim.keymap.del
local map = vim.keymap.set

-- bufferline
unmap("n", "<S-h>")
unmap("n", "<S-l>")
unmap("n", "<leader>bb")
unmap("n", "<leader>`")

-- Terminal
local Terminal = require('toggleterm.terminal').Terminal
local tmux = Terminal:new({ cmd = "tmux", hidden = true, direction = "float", dir = "."})
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float", dir = "."})
local musicfox = Terminal:new({ cmd = "tmux attach-session -t musicfox", hidden = true, direction = "float", dir = "." })
function _lazygit_toggle()
  lazygit:toggle()
end
function _musicfox_toggle()
  musicfox:toggle()
end
function _tmux_toggle()
  tmux:toggle()
end
unmap("n", "<leader>fT")
unmap("n", "<leader>ft")
unmap("n", "<leader>gg")
unmap("n", "<leader>gG")
unmap("n", "<C-/>")
map("n", "<leader>tt", "<cmd>lua _tmux_toggle()<cr>", {noremap = true, silent = true, desc = "ToggleTerm Float"})
map("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<cr>", {noremap = true, silent = true, desc = "Lazygit"})
map("n", "<leader>tm", "<cmd>lua _musicfox_toggle()<cr>", {noremap = true, silent = true, desc = "Musicfox (tmux)"})
map("t", "<C-Esc>", "<C-\\><C-n><cmd>ToggleTerm<cr>")

-- other
unmap("n", "<C-s>") --save file


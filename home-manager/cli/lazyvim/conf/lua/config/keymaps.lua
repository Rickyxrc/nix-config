-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
map("n", ";", ":", {noremap = true, silent = true, desc="remap command"})
map("n", "]t", "<cmd>tabnext<CR>", {noremap = true, silent = true, desc="Next Tab"})
map("n", "[t", "<cmd>tabprevious<CR>", {noremap = true, silent = true, desc="Previous Tab"})


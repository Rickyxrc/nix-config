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
unmap("n", "<leader>fT")
unmap("n", "<leader>ft")


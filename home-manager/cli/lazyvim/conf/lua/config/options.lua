-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Toggleterm config
-- vim.api.nvim_set_keymap("n", "<leader>rt", '<cmd>ToggleTerm direction="float"<CR>i<Backspace>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("t", "hb", '<C-\\><C-n><cmd>ToggleTerm direction="float"<CR>', {noremap = true, silent = true})

-- Neovide config
local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.transparency or 0.95))
end
if vim.g.neovide then
    vim.g.neovide_scale_factor = 0.75
    vim.g.neovide_transparency = 0.9
    vim.g.transparency = 0.9
    vim.g.neovide_background_color = "#0f1117" .. alpha()
    vim.g.neovide_window_blurred = true
    vim.g.neovide_floating_blur_amount_x = 8.0
    vim.g.neovide_floating_blur_amount_y = 8.0
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_cursor_vfx_mode = "pixiedust"
end

vim.g.mapleader = " "
vim.g.mouse = null
vim.wo.relativenumber = false


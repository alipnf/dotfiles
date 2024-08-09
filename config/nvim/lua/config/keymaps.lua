-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set
-- icon-picker
map("n", "<Leader>ic", "<cmd>IconPickerNormal<cr>", { noremap = true, silent = true })
map("n", "<Leader>iy", "<cmd>IconPickerYank<cr>", { noremap = true, silent = true })
map("i", "<C-c>", "<cmd>IconPickerInsert<cr>", { noremap = true, silent = true })
-- silicon
map("v", "<Leader>S", "<cmd>'<,'>Silicon<cr>", { noremap = true, silent = true, desc = "Silicon" })

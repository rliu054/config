-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<ESC>", { silent = true })
vim.keymap.set("i", "<C-c>", "<Esc>", { silent = true })

-- Terminal mode key mappings
-- Go from TERMINAL mode to NORMAL mode
vim.api.nvim_set_keymap("t", "jj", "<C-\\><C-n>", { noremap = true, silent = true })

-- Enable CTRL-j and CTRL-k to cycle through history
vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-j>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-k>", { noremap = true, silent = true })

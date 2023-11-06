-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.list = false -- Don't show invisible characters (tabs, spaces, etc.)
vim.opt.relativenumber = false -- relative line numbers off by default
vim.g.autoformat = false -- don't autoformat on save
-- set fold options (using nvim-ufo)
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
-- add a vertical bar at line 100
vim.cmd[[set colorcolumn=100]]

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.list = false -- Don't show invisible characters (tabs, spaces, etc.)
vim.opt.relativenumber = false -- relative line numbers off by default
-- use treesitter to find folds
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd[[set nofoldenable]] -- stop auto-fold on file open
-- add a vertical bar at line 100
vim.cmd[[set colorcolumn=100]]

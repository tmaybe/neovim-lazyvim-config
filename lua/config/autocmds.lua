-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- always show full source on markdown and quarto files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown", "quarto" },
  callback = function()
    vim.wo.conceallevel = 0
  end,
})

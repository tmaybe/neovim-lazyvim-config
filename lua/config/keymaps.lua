-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- disable the lazygit keymaps
vim.keymap.del("n", "<leader>gg")
vim.keymap.del("n", "<leader>gG")

-- run oi with the word under the cursor, specifying a commit
vim.keymap.set(
  "n",
  "<Leader>yoi",
  "yiw:!oi<Space>-c<Space><C-r>0<CR>",
  { silent = true, desc = "Open commit hash under cursor in GitHub" }
)

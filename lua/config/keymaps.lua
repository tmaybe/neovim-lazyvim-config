-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- save on enter
vim.keymap.set("n", "<cr>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- format the current file with jq
vim.keymap.set(
  "n",
  "cj",
  "<cmd>%!jq .<cr>",
  { silent = true, desc = "Format the current file with jq"}
)

-- run oi with the word under the cursor, specifying a commit
-- https://github.com/tmaybe/laptop-setup/blob/base/bin/oi
vim.keymap.set(
  "n",
  "<Leader>yoi",
  "yiw:!oi<Space>-c<Space><C-r>0<CR>",
  { silent = true, desc = "Open commit hash under cursor in GitHub" }
)

-- toggle absolute & relative line numbers
vim.keymap.set("n", "yon", "<cmd>se nu!<cr>", { silent = true, desc = "Toggle absolute line numbers" })
vim.keymap.set("n", "yor", "<cmd>se rnu!<cr>", { silent = true, desc = "Toggle relative line numbers" })

-- [<space> and ]<space> to insert blank lines above & below current line
vim.keymap.set(
  "n",
  "[<Space>",
  "<cmd>call append(line('.')-1, '')<cr>",
  { silent = true, desc = "Insert blank line above" }
)
vim.keymap.set(
  "n",
  "]<Space>",
  "<cmd>call append(line('.'), '')<cr>",
  { silent = true, desc = "Insert blank line below" }
)

-- [a and ]a to move the current line up and down
vim.keymap.set(
  "n",
  "[a",
  "<cmd>m -2<cr>",
  { silent = true, desc = "Move current line up one" }
)

vim.keymap.set(
  "n",
  "]a",
  "<cmd>m +1<cr>",
  { silent = true, desc = "Move current line down one" }
)

-- copy the path of the current file
vim.keymap.set(
  "n",
  "<Leader>cg",
  "<cmd>let @+ = expand('%')<cr>",
  { desc = "Copy file path" }
)

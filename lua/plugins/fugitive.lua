-- add fugitive
return {
  {
    "tpope/vim-fugitive",
    dependencies = { "tpope/vim-rhubarb" },
    keys = {
      { "<leader>gb", "<cmd>Git blame<cr>", desc = "Open git blame" },
      { "<leader>gr", "<cmd>GBrowse<cr>", desc = "Open the current file in GitHub" },
    },
  },
}

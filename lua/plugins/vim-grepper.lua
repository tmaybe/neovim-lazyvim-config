-- add vim-grepper
-- provides prompt for ripgrep commands
return {
  {
    "mhinz/vim-grepper",
    config = function()
      vim.g.grepper = {
        tools = { "rg", "git" },
        simple_prompt = 0,
      }
    end,
    event = "VeryLazy",
    keys = {
      {
        "<leader>rr",
        "<cmd>Grepper<cr>",
        desc = "Find in root directory",
      },
      {
        "<leader>rw",
        "<cmd>Grepper -cword -noprompt<cr>",
        desc = "Find word under cursor in root directory",
      },
    },
  },
}

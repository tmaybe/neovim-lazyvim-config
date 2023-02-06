-- change unwanted lazyvim defaults
return {
  -- change default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
  -- disable neo-tree
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  -- remove neo-tree extension to lualine
  {
    "nvim-lualine/lualine.nvim",
    opts = { extensions = {} },
  },
  -- disable flit
  { "ggandor/flit.nvim", enabled = false },
  -- reconfigure leap
  {
    "ggandor/leap.nvim",
    dependencies = {},
    config = function()
      local leap = require("leap")
      leap.add_default_mappings(true)
      leap.setup({
        highlight_unlabeled_phase_one_targets = true,
        case_sensitive = true,
      })
    end,
  },
  -- ensure mason installs these
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "eslint_d",
        "rubocop",
        "solargraph",
        "yaml-language-server",
      },
    },
  },
}

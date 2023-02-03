-- change unwanted lazyvim default configurations
return {
  -- remove neo-tree extension to lualine
  {
    "nvim-lualine/lualine.nvim",
    opts = { extensions = {} },
  },
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
        "typescript-language-server",
        "yaml-language-server",
      },
    },
  },
}

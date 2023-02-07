-- change unwanted lazyvim defaults
return {
  -- change default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "base16-gigavolt",
    },
  },
  -- no animation for indent lines
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        animation = require("mini.indentscope").gen_animation.none(),
      },
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
  -- add ruby to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "ruby" })
      end
    end,
  },
}

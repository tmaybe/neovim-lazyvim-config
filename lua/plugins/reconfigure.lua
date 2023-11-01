-- change unwanted lazyvim defaults
return {
  -- change default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
  -- disable catppuccin colorscheme
  {
    "catppuccin", enabled = false
  },
  -- don't autoformat on save
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
    }
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
  -- reconfigure lualine
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- no clock
      table.remove(opts.sections.lualine_z)
    end,
  },
  -- don't highlight and default icons for nvim-navic
  {
    "SmiteshP/nvim-navic",
    opts = function()
      return {
        separator = " ",
        highlight = false,
        depth_limit = 5,
      }
    end,
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
        "yaml-language-server",
      },
    },
  },
  -- add ruby & endwise to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "RRethy/nvim-treesitter-endwise",
    },
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "ruby" })
      end
      return vim.tbl_deep_extend("force", opts, {
        endwise = { enable = true },
        indent = { enable = false },
      })
    end,
  },
  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      -- manually show the menu on tab and don't auto-select the first option
      opts.preselect = cmp.PreselectMode.None
      opts.completion = {
        autocomplete = false,
        completeopt = "menu,menuone,noinsert,noselect"
      }

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
  {
    "goolord/alpha-nvim",
    opts = function(_, dashboard)
      local logo = [[
░▀▄▀░▄▀▄░█▒█  ▒▄▀▄▒█▀▄▒██▀  ░█▄█▒██▀▒█▀▄▒██▀
░▒█▒░▀▄▀░▀▄█▒░░█▀█░█▀▄░█▄▄▒░▒█▒█░█▄▄░█▀▄░█▄▄
      ]]
      dashboard.section.header.val = vim.split(logo, "\n")
    end,
  },
}

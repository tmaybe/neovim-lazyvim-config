-- change unwanted lazyvim defaults
return {
  -- change default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
  -- disable catppuccin and tokyonight colorschemes
  {
    "catppuccin",
    enabled = false,
  },
  {
    "tokyonight.nvim",
    enabled = false,
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
  -- disable inlay/inline lsp hints
  {
    "nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
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
        completeopt = "menu,menuone,noinsert,noselect",
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
    {
      "folke/snacks.nvim",
      opts = function(_, opts)
        --
        -- show a custom message on the dashboard (Snacks.dashboard)
        local time = os.date("*t")
        local header = {}

        if time.hour > 1 and time.hour < 12 then
          header = {
            [[]],
            [[       ┓           •    ]],
            [[┏┓┏┓┏┓┏┫  ┏┳┓┏┓┏┓┏┓┓┏┓┏┓]],
            [[┗┫┗┛┗┛┗┻  ┛┗┗┗┛┛ ┛┗┗┛┗┗┫]],
            [[ ┛                     ┛]],
            [[]],
          }
        elseif time.hour > 11 and time.hour < 17 then
          header = {
            [[]],
            [[       ┓    ┏             ]],
            [[┏┓┏┓┏┓┏┫  ┏┓╋╋┏┓┏┓┏┓┏┓┏┓┏┓]],
            [[┗┫┗┛┗┛┗┻  ┗┻┛┗┗ ┛ ┛┗┗┛┗┛┛┗]],
            [[ ┛                        ]],
            [[]],
          }
        elseif time.hour > 16 and time.hour < 21 then
          header = {
            [[]],
            [[       ┓          •    ]],
            [[┏┓┏┓┏┓┏┫  ┏┓┓┏┏┓┏┓┓┏┓┏┓]],
            [[┗┫┗┛┗┛┗┻  ┗ ┗┛┗ ┛┗┗┛┗┗┫]],
            [[ ┛                    ┛]],
            [[]],
          }
        else
          header = {
            [[]],
            [[       ┓    •  ┓  ]],
            [[┏┓┏┓┏┓┏┫  ┏┓┓┏┓┣┓╋]],
            [[┗┫┗┛┗┛┗┻  ┛┗┗┗┫┛┗┗]],
            [[ ┛            ┛   ]],
            [[]],
          }
        end

        opts.dashboard.preset.header = table.concat(header, "\n")
      end,
    },
  },
}

-- add new plugins
return {
  -- git & github interaction
  {
    "tpope/vim-fugitive",
    dependencies = { "tpope/vim-rhubarb" },
    keys = {
      { "<leader>gb", "<cmd>Git blame<cr>", desc = "Open git blame" },
    },
  },
  {
    "ruifm/gitlinker.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>gr",
        function()
          local gl = package.loaded.gitlinker
          gl.get_buf_range_url(
            "n",
            {
              action_callback = require("gitlinker.actions").open_in_browser,
              add_current_line_on_normal_mode = false,
              print_url = false,
            },
            { silent = true }
          )
        end,
        mode = "n",
        desc = "Open current file in GitHub",
      },
      {
        "<leader>gr",
        function()
          local gl = package.loaded.gitlinker
          gl.get_buf_range_url(
            "v",
            {
              action_callback = require("gitlinker.actions").open_in_browser,
              print_url = false,
            },
            { silent = true }
          )
        end,
        mode = "v",
        desc = "Open current file with the selected lines highlighted in GitHub",
      },
    },
    opts = { mappings = nil },
  },
  -- file navigation
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup({
        keymaps = {
          ["-"] = "actions.parent",
          ["H"] = "actions.parent",
          ["<CR>"] = "actions.select",
          ["L"] = "actions.select",
          ["g."] = "actions.toggle_hidden",
          ["g?"] = "actions.show_help",
          ["q"] = "actions.close",
        },
        use_default_keymaps = false,
      })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      {
        "-",
        function()
          require("oil").open_float()
        end,
        desc = "Open file explorer in current directory",
      },
    },
  },
  -- prompt for ripgrep
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
  -- show a preview when highlighting files in quickfix
  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
  },
  -- navigate between related files
  {
    "tpope/vim-projectionist",
    event = "VeryLazy",
    init = function()
      vim.g.projectionist_heuristics = {
        ["app/*"] = {
          ["app/*.rb"] = {
            alternate = "spec/{}_spec.rb",
            type = "source",
          },
          ["spec/*_spec.rb"] = {
            alternate = "app/{}.rb",
            type = "test",
          },
          ["*.ts"] = {
            alternate = "{}.spec.ts",
            type = "source",
          },
          ["*.spec.ts"] = {
            alternate = "{}.ts",
            type = "test",
          },
          ["*.tsx"] = {
            alternate = "{}.spec.tsx",
            type = "source",
          },
          ["*.spec.tsx"] = {
            alternate = "{}.tsx",
            type = "test",
          },
        },
        ["lib/*"] = {
          ["lib/*.rb"] = {
            alternate = "spec/lib/{}_spec.rb",
            type = "source",
          },
          ["spec/lib/*_spec.rb"] = {
            alternate = "lib/{}.rb",
            type = "test",
          },
        },
      }
    end,
    keys = {
      { "<leader>a", "<cmd>A<cr>", desc = "Go to alternate file" },
    },
  },
  -- better code folding
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "BufReadPost",
    opts = {},

    init = function()
      vim.keymap.set("n", "zR", function()
        require("ufo").openAllFolds()
      end)
      vim.keymap.set("n", "zM", function()
        require("ufo").closeAllFolds()
      end)
    end,
  },
  -- base 16 colorschemes
  -- use "base16-gigavolt" to select
  {
    "RRethy/nvim-base16",
  },
  -- nightfox colorscheme
  -- use "carbonfox" to select
  {
    "EdenEast/nightfox.nvim",
  },
  -- kanagawa colorscheme
  -- use "kanagawa" to select
  {
    "rebelot/kanagawa.nvim",
    -- color the window separator hot pink
    config = function()
      require("kanagawa").setup({
        overrides = function()
          return { WinSeparator = { fg = "#FF69B4" } }
        end
      })
    end,
  },
}

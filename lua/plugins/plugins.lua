-- add new plugins
return {
  -- git & github interaction
  {
    "tpope/vim-fugitive",
    dependencies = { "tpope/vim-rhubarb" },
    keys = {
      { "<leader>gb", "<cmd>Git blame<cr>", desc = "Open git blame" },
      { "<leader>gr", "<cmd>GBrowse<cr>", desc = "Open the current file in GitHub" },
    },
  },
  -- file navigation
  {
    "mcchrish/nnn.vim",
    config = function()
      require("nnn").setup({
        command = "nnn -o -A",
        set_default_mappings = 0,
        replace_netrw = 1,
        layout = { ["window"] = { ["width"] = 0.8, ["height"] = 0.8, ["highlight"] = "Debug" } },
      })
    end,
    event = "VeryLazy",
    keys = {
      {
        "-",
        function()
          local path = vim.fn.expand("%:p")
          local nnn_command = path == "" and "NnnPicker" or ("NnnPicker" .. path)
          vim.api.nvim_command(nnn_command)
        end,
        desc = "Open nnn file manager",
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

-- add nnn
return {
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
}

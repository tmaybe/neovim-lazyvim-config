-- change unwanted lazyvim default configurations
return {
  -- remove neo-tree extension to lualine
  {
    "nvim-lualine/lualine.nvim",
    opts = { extensions = {} },
  },
}

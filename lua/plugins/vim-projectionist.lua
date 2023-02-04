-- add vim-projectionist
-- relate files in a project
return {
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
  },
}

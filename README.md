# neovim config

My neovim config, based on the
💤 [LazyVim](https://github.com/LazyVim/LazyVim) starter template. Refer to
the [documentation](https://lazyvim.github.io/installation) to make your own.

## What's changed from the default settings?

1. Remove [Neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) and
   use [oil.nvim](https://github.com/stevearc/oil.nvim) instead
1. Install and configure the git plugins [vim-fugitive](https://github.com/tpope/vim-fugitive),
   [vim-rhubarb](https://github.com/tpope/vim-rhubarb), and
   [gitlinker](https://github.com/ruifm/gitlinker.nvim) for showing git blame (`<Leader>gb`) and
   opening the current file in GitHub (`<Leader>gr`)
1. Customize autocomplete behavior (only activate on `<Tab>`, don't autoselect first suggestion)
1. Default to absolute line numbers and add quick shortcuts to toggle
   absolute (`yon`) & relative (`yor`)
1. Add [Grepper](https://github.com/mhinz/vim-grepper) to get a command-line style ripgrep
   prompt that puts results in quickfix (`<Leader>rr` or `<Leader>rw` to quick-search the
   word under the cursor) 
1. Add [nvim-bqf](https://github.com/kevinhwang91/nvim-bqf) to show previews of files in quickfix
1. Add/enable LSP support and other conveniences for Python and Typescript.
1. Add and configure alternate file navigation with
   [vim-projectionist](https://github.com/tpope/vim-projectionist) (`<Leader>a`)
1. Use [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) for code folding
1. Save files on `<Enter>` and don't autoformat on save
1. Add shortcuts to insert blank lines (`[<Space>`, `]<Space>`) and to move the current line up (`[a`) or down (`]a`)
1. Add shortcut to copy current file's path to clipboard (`<Leader>cg`)
1. Various cosmetic changes (add new colorschemes and change default, hide invisible
   characters, show vertical bar, don't animate indent lines, remove the clock on lualine)

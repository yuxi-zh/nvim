-- nvim-tree configuration 

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local nvim_tree = require("nvim-tree")
nvim_tree.setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

require('keybindings').nvim_tree_mapping(nvim_tree)

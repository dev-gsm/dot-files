require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set('n', '<c-n>', ':NvimTreeToggle<CR>')

vim.api.nvim_set_hl(0,"NvimTreeNormal",{bg="none"})
vim.api.nvim_set_hl(0,"NvimTreeNormal",{bg="none"})
vim.api.nvim_set_hl(0,"NvimTreeNormalNC",{bg="none"})

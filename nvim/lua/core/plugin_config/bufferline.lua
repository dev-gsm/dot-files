vim.opt.termguicolors = true
require("bufferline").setup{
  options = {
    mode = "tabs",
    separator_style = "slant",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        separator = true -- use a "true" to enable the default, or set your own character
      }
    }
  }
}

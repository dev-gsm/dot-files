-- require("catppuccin").setup({
--   flavour = "mocha",
--   transparent_background = true,
--   styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
--     comments = { "italic" }, -- Change the style of comments
--   },
-- })

-- vim.o.termguicolors = true
-- vim.o.background = "dark"
-- vim.cmd[[colorscheme catppuccin]]

require("tokyonight").setup(
  {
    style = 'storm',
    light_style = 'day',
    transparent = true
  }
)

vim.cmd[[colorscheme tokyonight]]

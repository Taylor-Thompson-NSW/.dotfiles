vim.g.my_colorscheme = "gruvbox-material"
-- vim.g.my_colorscheme = "tokyonight"

require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  transparent = true, -- Enable this to disable setting the background color
})

--thanks prime
function ColorMyPencils()
  vim.g.gruvbox_material_enable_bold=1
  vim.g.gruvbox_material_better_performance = 1
  vim.g.gruvbox_material_foreground='mix'
  ----------------------------------
  --BACKGROUND TRANSPARENCY SETTING
  vim.g.gruvbox_material_transparent_background=1
  ----------------------------------

  ----------------------------------
  --SET THE COLOR SCHEME
  vim.cmd("colorscheme " .. vim.g.my_colorscheme)
  ----------------------------------

end
ColorMyPencils()

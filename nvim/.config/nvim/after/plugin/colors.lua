--SELECT COLORSCHEME
-- vim.g.my_colorscheme = "gruvbox-material"
-- vim.g.my_colorscheme = "tokyonight"
-- vim.g.my_colorscheme = "catppuccin"
vim.g.my_colorscheme = "rose-pine"
--

require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "night",   -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  transparent = true, -- Enable this to disable setting the background color
})

require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = {
    -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = true,
  show_end_of_buffer = false, -- show the '~' characters after the end of buffers
  term_colors = false,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  no_italic = false, -- Force no italic
  no_bold = false,  -- Force no bold
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = { "bold" },
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {},
  custom_highlights = {},
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    notify = false,
    mini = false,
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})

require("rose-pine").setup({
  --- @usage 'auto'|'main'|'moon'|'dawn'
  variant = "auto",
  --- @usage 'main'|'moon'|'dawn'
  dark_variant = "main",
  bold_vert_split = false,
  dim_nc_background = false,
  disable_background = true,
  disable_float_background = false,
  disable_italics = false,
  --- @usage string hex value or named color from rosepinetheme.com/palette
  groups = {
    background = "base",
    background_nc = "_experimental_nc",
    panel = "base",
    panel_nc = "base",
    border = "highlight_med",
    comment = "muted",
    link = "iris",
    punctuation = "subtle",
    error = "love",
    hint = "iris",
    info = "foam",
    warn = "gold",
    headings = {
      h1 = "iris",
      h2 = "foam",
      h3 = "rose",
      h4 = "gold",
      h5 = "pine",
      h6 = "foam",
    },
    -- or set all headings at once
    -- headings = 'subtle'
  },
  -- Change specific vim highlight groups
  -- https://github.com/rose-pine/neovim/wiki/Recipes
  highlight_groups = {
    ColorColumn = { bg = "love", blend = 10 },
    -- Blend colours against the "base" background
    CursorLine = { bg = "foam", blend = 10 },
    StatusLine = { fg = "love", bg = "love", blend = 10 },
  },
})

-- Set colorscheme after options
vim.cmd("colorscheme rose-pine")

--thanks prime
function ColorMyPencils()
  vim.g.gruvbox_material_enable_bold = 1
  vim.g.gruvbox_material_better_performance = 1
  vim.g.gruvbox_material_foreground = "mix"
  ----------------------------------
  --BACKGROUND TRANSPARENCY SETTING
  vim.g.gruvbox_material_transparent_background = 1
  ----------------------------------

  ----------------------------------
  --SET THE COLOR SCHEME
  vim.cmd("colorscheme " .. vim.g.my_colorscheme)
  ----------------------------------
end

ColorMyPencils()

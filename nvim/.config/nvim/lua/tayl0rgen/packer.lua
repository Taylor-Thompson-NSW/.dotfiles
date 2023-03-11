return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  use("ryanoasis/vim-devicons")
  use("mhinz/vim-startify")

  --Snippets
  use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" })
  use("rafamadriz/friendly-snippets")

  --Code Comment plugins
  use("tpope/vim-commentary")
  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- Close tags
  use("alvan/vim-closetag")

  --LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }
  --

  --symbols outline & autopairs/tags
  use("simrat39/symbols-outline.nvim")
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")

  --rust-tools
  use 'simrat39/rust-tools.nvim'
  --null-ls
  use("jose-elias-alvarez/null-ls.nvim")


  --Harpoon by ThePrimeagen
  use("ThePrimeagen/harpoon")
  use("ThePrimeagen/vim-be-good")


  --Treesitter -----------------
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use("nvim-treesitter/nvim-treesitter-context")
  --use("p00f/nvim-ts-rainbow")
  ------------------------------
  --telescope
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")
  use("nvim-telescope/telescope.nvim")
  use("nvim-telescope/telescope-fzy-native.nvim")
  --NeoFormat
  use("sbdchd/neoformat")
  --vim-graphql
  use("jparise/vim-graphql")

  --git
  use('tpope/vim-fugitive')

  --color schemes
  use("sainnhe/gruvbox-material")
  use { "folke/tokyonight.nvim", branch = "main" }
  use { "catppuccin/nvim", as = "catppuccin" }
  use({ 'rose-pine/neovim', as = 'rose-pine' })

  -----------------------------
  --Jupyter & Neovim plugin - Search specifically for: Magma
  use { "dccsillag/magma-nvim", run = ":UpdateRemotePlugins" }
end
)

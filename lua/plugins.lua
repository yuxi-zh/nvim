require('packer').startup(function(use)
  -- Packer itself
  use 'wbthomason/packer.nvim'
  -- Icons
  use 'kyazdani42/nvim-web-devicons'
  -- File explore
  use {
    'kyazdani42/nvim-tree.lua',
    tag = 'nightly'
  }
  -- Buffer line
  use 'akinsho/bufferline.nvim'
  -- Lanaguage server installer 
  use 'williamboman/nvim-lsp-installer'
  -- Language server configuration
  use 'neovim/nvim-lspconfig'
  -- LSP complete source
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  -- LSP complete
  use 'hrsh7th/nvim-cmp'
  -- vsnip
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'rafamadriz/friendly-snippets'
  -- lspkind
  use 'onsails/lspkind-nvim'
  -- Fuzzy find
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'BurntSushi/ripgrep'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- Terminal
  use { "akinsho/toggleterm.nvim", tag = '*' }
  -- Color theme
  use "ellisonleao/gruvbox.nvim"
  -- Auto pairs
  use 'windwp/nvim-autopairs'
  -- Tab vertical line
  use "lukas-reineke/indent-blankline.nvim"
end)



print("load lua/plugins.lua")

local status, packer = pcall(require, "packer")
if (not status) then
   print("packer is not installed")
   return
end

vim.cmd("packadd packer.nvim")

packer.startup(function(use)
  use { "wbthomason/packer.nvim" }
  use { "ellisonleao/gruvbox.nvim" }
  use { 'kyazdani42/nvim-web-devicons' }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use { "nvim-lua/plenary.nvim" }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use { "L3MON4D3/LuaSnip" }

  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use { "neovim/nvim-lspconfig" }
  use { "onsails/lspkind-nvim" }
  use { "hrsh7th/cmp-nvim-lua" }
  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }

  use { "lervag/vimtex" }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
end)

print("load lua/plugins.lua")

local status, packer = pcall(require, "packer") 
if (not status) then
   print("packer is not installed")
   return
end


vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use { "wbthomason/packer.nvim" }
  use { "ellisonleao/gruvbox.nvim" }
end)

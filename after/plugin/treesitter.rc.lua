print("load after/plugin/treesitter.rc.lua")
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if (not status) then
  print("nvim-treesitter.configs not found")
  return
end

treesitter.setup({
  ensure_installed = {
    "lua",
    "rust",
    "typescript",
    "javascript",
    "go",
    "bash",
    "json",
    "css",
    "php",
    "r",
    "tsx",
    "scss",
    "dockerfile",
    "markdown",
    "yaml",
    "html",
    "latex",
  },
  highlight = {
    enable = true,
  },
  auto_install = true,
  sync_install = false,
})

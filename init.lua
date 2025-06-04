vim.notify("init.lua", vim.log.levels.INFO)

require("core.settings")
require("core.diagnostics")
require("core.lazy")

local lazy_opts = {
  rocks = {
    enabled = false,
  },
}

require("lazy").setup("plugins", lazy_opts)

local ok, err = pcall(vim.cmd.colorscheme, vim.g.colorscheme)
if not ok then
  vim.notify("Colorscheme '" .. vim.g.colorscheme .. "' does not exist", vim.log.levels.ERROR)
end


vim.notify("lua/plugins/indent-blankline.lua", vim.log.levels.INFO)

return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  }
}

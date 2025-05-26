vim.notify("lua/plugins/lsp.lua", vim.log.levels.INFO)

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      vim.lsp.config("biome", {
        cmd = {"npx", "biome", "lsp-proxy" }
      });

      vim.lsp.enable({ "clangd" , "biome" , "lua_ls"})

      vim.diagnostic.config({ virtual_text = true })
    end,
  }
}

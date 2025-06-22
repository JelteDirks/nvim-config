return {
  {
    'MeanderingProgrammer/render-markdown.nvim',

    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons'
    },

    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},

    config = function(_, opts)

      local lopts = {
        completions = {
          blink = {
            enabled = true
          },
        },
      }

      require("render-markdown").setup(lopts)
    end,
  }
}

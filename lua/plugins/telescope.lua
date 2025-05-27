vim.notify("lua/plugins/telescope.lua", vim.log.levels.INFO)

return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    lazy = true,
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      { "nvim-telescope/telescope-ui-select.nvim" },
      {
        "nvim-tree/nvim-web-devicons",
        enabled = vim.g.have_nerd_font,
      },
    },
    opts = {
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local localopts = {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      }

      vim.tbl_deep_extend("force", opts, localopts)

      telescope.setup(opts)

      local ok
      ok, _ = pcall(telescope.load_extension, "fzf")
      if not ok then
        vim.notify("fzf extension could not be loaded", vim.log.levels.WARN)
      end

      ok, _ = pcall(telescope.load_extension, "ui-select")
      if not ok then
        vim.notify("ui-select extensions could not be loaded", vim.log.levels.WARN)
      end

      vim.keymap.set("n", "<leader>fd", function()
        require("telescope.builtin").diagnostics()
      end, { desc = "Find diagnostics" })

      vim.keymap.set("n", "<leader>FD", function()
        require("telescope.builtin").diagnostics({bufnr = 0})
      end, { desc = "Find all diagnostics from current buffer" })
    end,
  }
}

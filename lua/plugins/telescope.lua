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

      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>fh", function()
        builtin.help_tags()
      end, { desc = "Find help tags" })

      vim.keymap.set("n", "<leader>fd", function()
              builtin.diagnostics()
            end, { desc = "Find diagnostics" })

      vim.keymap.set("n", "<leader>fk", function()
        builtin.keymaps()
      end, { desc = "Search lines with grep" })

      vim.keymap.set("n", "<leader>fg", function()
        builtin.live_grep()
      end, { desc = "Search lines with grep" })

      vim.keymap.set("n", "<leader>FD", function()
        builtin.diagnostics({bufnr = 0})
      end, { desc = "Find all diagnostics from current buffer" })

      vim.keymap.set("n", "<leader>fb", function()
        builtin.buffers()
      end, { desc = "Find all open buffers" })

      vim.keymap.set("n", "<leader>ff", function()
        builtin.find_files()
      end, { desc = "Find all files in the working directory" })
    end,
  }
}

vim.notify("lua/plugins/todo.lua", vim.log.levels.INFO)

return {
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = false,
    },
    config = function(_, opts)
      require("todo-comments").setup(opts)

      vim.keymap.set("n", "]td", function()
        require("todo-comments").jump_next()
      end, { desc = "Next todo comment" })

      vim.keymap.set("n", "[td", function()
        require("todo-comments").jump_prev()
      end, { desc = "Previous todo comment" })

      vim.keymap.set("n", "<leader>tt", function()
        vim.cmd("TodoTelescope")
      end, { desc = "Search TODOs (Telescope)" })

      vim.keymap.set("n", "<leader>tl", function()
        vim.cmd("TodoLocList")
      end, { desc = "TODOs in loclist (buffer)" })

      vim.keymap.set("n", "<leader>tq", function()
        vim.cmd("TodoQuickFix")
      end, { desc = "TODOs in quickfix (project)" })
    end
  }
}

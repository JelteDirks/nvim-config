return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {},
    init = function()
      local Snacks = require("snacks")
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          Snacks.toggle.inlay_hints():map("<leader>th", { desc = "Toggle inlay hints on/off (Snacks)" })
          Snacks.toggle.indent():map("<leader>ti", { desc = "Toggle indentation markers on/off (Snacks)" })

          Snacks.toggle({
            name = "Completion",
            get = function() return vim.g.completion end,
            set = function(state) vim.g.completion = state end,
          }):map("<leader>ta", { desc = "Toggle autocompletion on/off (Snacks)" })

          local groupname = "hide-diagnostics"
          Snacks.toggle({
            name = "Diagnostics",
            get = function()
              return vim.g.diagnostics
            end,
            set = function(state)
              vim.g.diagnostics = state
              local hide_diag_group = vim.api.nvim_create_augroup(groupname, { clear = true })

              if vim.g.diagnostics then
                vim.api.nvim_create_autocmd("InsertEnter", {
                  group = hide_diag_group,
                  callback = function()
                    vim.diagnostic.enable(false)
                  end,
                })

                vim.api.nvim_create_autocmd("InsertLeave", {
                  group = hide_diag_group,
                  callback = function()
                    vim.diagnostic.enable(true)
                  end,
                })
              else
                vim.api.nvim_del_augroup_by_name(groupname)
              end

              vim.diagnostic.enable(vim.g.diagnostics)
            end,
          }):map("<leader>td", { desc = "Toggle diagnostics on/off globally (Snacks)" })
        end,
      })
    end,
  },
}

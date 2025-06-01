vim.notify("lua/plugins/gitsigns.lua", vim.log.levels.INFO)

return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        local function nmap(l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set("n", l, r, opts)
        end

        local function vmap(l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set("v", l, r, opts)
        end

        local gs = require("gitsigns")

        nmap("]H", function()
          gs.nav_hunk('last')
        end, { desc = "Go to the last hunk (Gitsigns)" })

        nmap("]h", function()
          gs.nav_hunk('next')
        end, { desc = "Go to the next hunk (Gitsigns)" })

        nmap("[h", function()
          gs.nav_hunk('prev')
        end, { desc = "Go to the previous hunk (Gitsigns)" })

        nmap("[H", function()
          gs.nav_hunk('first')
        end, { desc = "Go to the first hunk (Gitsigns)" })

        nmap('<leader>hs', gs.stage_hunk, { desc = 'Stage/unstage hunk (Gitsigns)' })
        nmap('<leader>hr', gs.reset_hunk, { desc = 'Reset hunk (Gitsigns)' })
        nmap('<leader>hS', gs.stage_buffer, { desc = 'Stage entire buffer (Gitsigns)' })
        nmap('<leader>hR', gs.reset_buffer, { desc = 'Reset all ines in buffer (Gitsigns)' })
        nmap('<leader>hp', gs.preview_hunk, { desc = 'Preview hunk under cursor (Gitsigns)' })
        nmap('<leader>hb', gs.blame_line, { desc = 'Show line blame (Gitsigns)' })
        nmap('<leader>hd', gs.diffthis, { desc = 'Diff the file in the current buffer (Gitsigns)' })
        nmap('<leader>tb', gs.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })

        vmap('<leader>hs', function()
          gs.stage_hunk({ vim.fn.line '.', vim.fn.line 'v' })
        end, { desc = 'Stage selected text (Gitsigns)' })
        vmap('<leader>hr', function()
          gs.reset_hunk({ vim.fn.line '.', vim.fn.line 'v' })
        end, { desc = 'Reset selected text (Gitsigns)' })

      end
    },
  }
}

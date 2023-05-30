local nmap = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc })
end

local gitsigns = require("gitsigns")

gitsigns.setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

nmap("<leader>gp", function()
  gitsigns.prev_hunk()
end, "Gitsigns go to previous hunk")

nmap("<leader>gn", function()
  gitsigns.next_hunk()
end, "Gitsigns go to next hunk")

nmap("<leader>gsr", function()
  gitsigns.refresh()
end, "Gitsigns refresh all buffers")

nmap("<leader>gdf", function()
  gitsigns.preview_hunk()
end, "Gitsigns preview hunk in floating window")

nmap("<leader>gdi", function()
  gitsigns.preview_hunk_inline()
end, "Gitsigns preview hunk inline")

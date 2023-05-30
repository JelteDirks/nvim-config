local nmap = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc })
end

local gitsigns = require("gitsigns")

-- Gitsigns
-- See `:help gitsigns.txt`
gitsigns.setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
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

nmap("<leader>gdi", function()
  gitsigns.preview_hunk()
end, "Gitsigns go to next hunk")

nmap("<leader>gdd", function()
  gitsigns.preview_hunk_inline()
end, "Gitsigns go to next hunk")

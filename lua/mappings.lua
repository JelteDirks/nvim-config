local function map(mode, lhs, rhs, opts)
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

local noreopt = { noremap = true }

map("n", "<Leader>ff", "<cmd>Telescope find_files<cr>", noreopt)
map("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>", noreopt)
map("n", "<Leader>fb", "<cmd>Telescope buffers<cr>", noreopt)
map("n", "<Leader>fh", "<cmd>Telescope help_tags<cr>", noreopt)


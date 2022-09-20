print("load after/plugin/telescope.rc.lua")
local status2, builtin = pcall(require, "telescope.builtin")
if (not status2) then
  print("telescope.builtin not found")
  return
end

vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>fh", builtin.help_tags)
vim.keymap.set("n", "<leader>pp", builtin.planets)


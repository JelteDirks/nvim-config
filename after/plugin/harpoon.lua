local nmap = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc })
end

nmap('<leader>j', function()
  require('harpoon.ui').nav_file(1)
end, "Harpoon go to file 1")

nmap('<leader>k', function()
  require('harpoon.ui').nav_file(2)
end, "Harpoon go to file 2")

nmap('<leader>l', function()
  require('harpoon.ui').nav_file(3)
end, "Harpoon go to file 3")

nmap('<leader>;', function()
  require('harpoon.ui').nav_file(4)
end, "Harpoon go to file 4")

nmap('<leader>mc', function()
  require('harpoon.mark').clear_all()
end, "Harpoon clean all marks")

nmap('<leader>mm', function()
  require('harpoon.mark').add_file()
end, "Harpoon add file")

nmap('<leader>mu', function()
  require("harpoon.ui").toggle_quick_menu()
end, "Harpoon show menu")

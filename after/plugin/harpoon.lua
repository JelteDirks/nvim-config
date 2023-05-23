local nmap = function(keys, func)
  vim.keymap.set('n', keys, func)
end

nmap('<leader>j', function()
  require('harpoon.ui').nav_file(1)
end)

nmap('<leader>k', function()
  require('harpoon.ui').nav_file(2)
end)

nmap('<leader>l', function()
  require('harpoon.ui').nav_file(3)
end)

nmap('<leader>;', function()
  require('harpoon.ui').nav_file(4)
end)

nmap('<leader>mc', function()
  require('harpoon.mark').clear_all()
end)

nmap('<leader>mm', function()
  require('harpoon.mark').add_file()
end)

nmap('<leader>mu', function()
  require("harpoon.ui").toggle_quick_menu()
end)

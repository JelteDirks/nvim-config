print('load lua/maps.lua')

local keymap = vim.keymap;

keymap.set('n', 'x', '"_x') -- don't yank with x

keymap.set('n', '+', '<C-a>') -- increment numbers
keymap.set('n', '-', '<C-x>') -- decrement numbers

-- splitting windows
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true }) -- open horizontal split and move to it 
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true }) -- open vertical split and move to it

-- moving between windows
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sl', '<C-w>l')

-- resizing windows
keymap.set('n', '<left>', '<C-w><')
keymap.set('n', '<right>', '<C-w>>')
keymap.set('n', '<up>', '<C-w>+')
keymap.set('n', '<down>', '<C-w>-')

--keymap.set('n', '<left>', ':vertical resize -10<Return>')
--keymap.set('n', '<right>', ':vertical resize +10<Return>')
--keymap.set('n', '<up>', ':resize +10<Return>')
--keymap.set('n', '<down>', ':resize -10<Return>')




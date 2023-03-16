local theme = 'onedark'

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = theme,
    component_separators = '|',
    section_separators = '',
  },
}

vim.cmd.colorscheme(theme)
-- Transparant background
vim.api.nvim_set_hl(0, "Normal", { bg = 'none' })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'none' })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = 'none' })
vim.api.nvim_set_hl(0, "SignColumn", { bg = 'none' })

-- require('lualine').setup({
--   options = {
--     icons_enabled = true,
--     theme = 'onedark',
--     component_separators = { left = '', right = ''},
--     section_separators = { left = '', right = ''},
--     disabled_filetypes = { }
--   },
--   sections = {
--     lualine_a = {'mode'},
--     lualine_b = {'branch', 'diff', 'diagnostics'},
--     lualine_c = {
--       {
--         'filename',
--         file_status = true, -- show file status
--         path = 0, -- display only filename
--       },
--       'buffers'},
--     lualine_x = {
--       {
--         'diagnostics',
--         sources = { 'nvim_diagnostic' },
--         sections = { 'error', 'warn', 'info', 'hint' },
--         symbols = { error = ' ', warn = ' ', hint = ' ', info = ' ' }
--       }
--     },
--     lualine_y = {'progress'},
--     lualine_z = {'location'}
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = { {
--       'filename',
--       file_status = true,
--       path = 1, -- display full path
--     } },
--     lualine_x = {'location'},
--     lualine_y = {},
--     lualine_z = {}
--   },
--   tabline = {},
--   winbar = {},
--   inactive_winbar = {},
--   extensions = { 'fugitive' }
-- })


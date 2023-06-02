local theme = 'catppuccin'
--local theme = 'gruvbox'

require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = {
    light = "latte",
    dark = "mocha",
  },
  transparent_background = true,
  show_end_of_buffer = false, -- show the '~' characters after the end of buffers
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  no_italic = false,    -- Force no italic
  no_bold = false,      -- Force no bold
  no_underline = false, -- Force no underline
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {},
  custom_highlights = {},
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    harpoon = true,
    mason = true,
    treesitter = true,
    dap = {
      enabled = true,
      enable_ui = true,
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})

require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = false,   -- invert background for search, diffs, statuslines and errors
  contrast = "soft", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = true,
  transparent_mode = true,
})


require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = '|',
    section_separators = '',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics'},
    lualine_c = {
      {
        'filename',
        file_status = true, -- show file status
        path = 0,           -- display only filename
      },
      'buffers'
    },
    lualine_x = {
      'encoding',
      'fileformat',
    },
    lualine_y = {
      'progress'
    },
    lualine_z = {
      'location'
    }
  },
  extensions = {
    'fugitive',
    'nvim-dap-ui',
  },
}

vim.cmd.colorscheme(theme)

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

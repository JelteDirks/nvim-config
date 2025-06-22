vim.notify("lua/plugins/blink-cmp.lua", vim.log.levels.INFO)

return {
  {
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',

    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        opts = {},
      },
      'folke/lazydev.nvim',
    },

    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'default',
      },

      appearance = {
        nerd_font_variant = 'mono',
      },

      completion = {
        documentation = { auto_show = true },
        trigger = {
          show_on_insert_on_trigger_character = true,
          show_on_keyword = true,
          show_on_trigger_character = true,
          show_on_accept_on_trigger_character = true,
          show_on_x_blocked_trigger_characters = {},
        },
      },


      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },
      
      enabled = function()
        return vim.g.completion
      end,

      snippets = { preset = 'luasnip' },
      -- See :h blink-cmp-config-fuzzy for more information
      fuzzy = { implementation = 'rust' },

      signature = { enabled = true },
    },
  },
}

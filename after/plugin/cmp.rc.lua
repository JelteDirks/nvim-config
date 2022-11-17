print("load after/plugins/cmp.rc.lua")
local status, cmp = pcall(require, "cmp")
if (not status) then
  print("cmp not found")
  return
end

if cmp == nil then
  print("cmp is nil")
  return
end

local status2, lspkind = pcall(require, 'lspkind')
if (not status2) then
  print("can not find lspkind")
end

cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- show only symbol annotations
      maxwidth = 50,
      ellipsis_char = '...',
    })
  },

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    --['<C-d>'] = cmp.mapping.scroll_docs(-8),
    --['<C-f>'] = cmp.mapping.scroll_docs(8),
    --['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
  }),

}

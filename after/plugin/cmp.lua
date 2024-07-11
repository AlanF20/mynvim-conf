local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format({details = true})
-- Carga friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()
cmp.event:on(
	'confirm_done',
	cmp_autopairs.on_confirm_done()
	)
cmp.setup({
  mapping = {
    ['<Tab>'] = cmp.mapping.confirm({select = true }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
    ['<C-p>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({ behavior = 'insert' })
      else
        cmp.complete()
      end
    end),
    ['<C-n>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item({ behavior = 'insert' })
      else
        cmp.complete()
      end
    end),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }),
  formatting = cmp_format,
  window = {
	  completion = cmp.config.window.bordered(),
	  documentation = cmp.config.window.bordered()
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  confirmation = { completeopt = 'menu,menuone,noinsert' }
})

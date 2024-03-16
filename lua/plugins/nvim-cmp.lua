return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim'
  },
  opts = function()
    local cmp_status, cmp = pcall(require, "cmp")
    if not cmp_status then
      print("CMP no está instalado")
      return
    end

    -- Importa luasnip de forma segura
    local luasnip_status, luasnip = pcall(require, "luasnip")
    if not luasnip_status then
      print("Luasnip no está instalado")
      return
    end

    -- Importa lspkind de forma segura
    local lspkind_status, lspkind = pcall(require, "lspkind")
    if not lspkind_status then
      print("lspkind no está instalado")
      return
    end

    -- Mejor experiencia de autocompletado
    vim.o.completeopt = 'menuone,noselect'

    cmp.setup {

      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),

        --  Usa tab y S-tab para mover el menu
        ['<Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end,
        ['<S-Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end,

      }),


      -- Format the autocomplete menu
      formatting = {
        format = lspkind.cmp_format()
      },


      -- Snippet configs
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' }
      },
    }

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline('/', {
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })

  end
}

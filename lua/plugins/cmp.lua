local cmp = require("cmp")
require("codeium").setup()
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    -- expend = function(args)
    --   require("garymjr/nvim-snippets").expand(args.body) -- Utiliza el plugin para la expansión de snippets
    -- end,
    -- expand = function(args) vim.snippet.expand(args.body) end,
    expand = function(args) require("luasnip").lsp_expand(args.body) end,
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  experimental = {
    ghost_text = true,
  },

  formatting = {
    format = function(entry, item)
      local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
      item = require("cmp-minikind").cmp_format()(entry, item)
      if color_item.abbr_hl_group then
        item.kind_hl_group = color_item.abbr_hl_group
        item.kind = color_item.abbr
      end
      return item
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete({}),
    ["<C-c>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),

  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer" },
    { name = "luasnip" },
    { name = "codeium" },
    { name = "cmp_r" },
  },
})

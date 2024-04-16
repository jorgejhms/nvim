local lspconfig = require("lspconfig")

-- LSP Server config
lspconfig.dockerls.setup({})
lspconfig.docker_compose_language_service.setup({})
lspconfig.marksman.setup({})

lspconfig.jsonls.setup({ -- [[ JSON config ]]
  -- lazy-load schemastore when needed
  on_new_config = function(new_config)
    new_config.settings.json.schemas = new_config.settings.json.schemas or {}
    vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
  end,
  settings = {
    json = {
      format = {
        enable = true,
      },
      validate = { enable = true },
    },
  },
})

--[ [  Lua ] ]
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
      diagnostics = {
        globals = { "vim" }, -- Reconoce vim como variable global
      },
    },
  },
})

-- Python
lspconfig.pyright.setup({})
lspconfig.ruff_lsp.setup({
  keys = {
    {
      "<leader>co",
      function()
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.organizeImports" },
            diagnostics = {},
          },
        })
      end,
      desc = "Organize Imports",
    },
  },
})

-- Taailwind CSS
lspconfig.tailwindcss.setup({
  filetypes_exclude = { "markdown" },
  filetypes_include = {},
})

-- typescript
lspconfig.tsserver.setup({
  keys = {
    {
      "<leader>co",
      function()
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.organizeImports.ts" },
            diagnostics = {},
          },
        })
      end,
      desc = "Organize Imports",
    },
    {
      "<leader>cR",
      function()
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.removeUnused.ts" },
            diagnostics = {},
          },
        })
      end,
      desc = "Remove Unused Imports",
    },
  },
  ---@diagnostic disable-next-line: missing-fields
  settings = {
    completions = {
      completeFunctionCalls = true,
    },
  },
})

-- Yaml
lspconfig.yamlls.setup({
  -- Have to add this for yamlls to understand that we support line folding
  capabilities = {
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      },
    },
  },
  -- lazy-load schemastore when needed
  on_new_config = function(new_config)
    new_config.settings.yaml.schemas =
      vim.tbl_deep_extend("force", new_config.settings.yaml.schemas or {}, require("schemastore").yaml.schemas())
  end,
  settings = {
    redhat = { telemetry = { enabled = false } },
    yaml = {
      keyOrdering = false,
      format = {
        enable = true,
      },
      validate = true,
      schemaStore = {
        -- Must disable built-in schemaStore support to use
        -- schemas from SchemaStore.nvim plugin
        enable = false,
        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        url = "",
      },
    },
  },
})

lspconfig.eslint.setup({
  settings = {
    -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
    workingDirectories = { mode = "auto" },
  },
})

-- R Language server
lspconfig.r_language_server.setup({})

-- LSP Attach function
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    -- Keymaps
    map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
    map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
    map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
    map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
    map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
    map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
    map("<leader>cr", vim.lsp.buf.rename, "[R]e[n]ame")
    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
    map("K", vim.lsp.buf.hover, "Hover Documentation")
    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    map("<leader>cf", vim.lsp.buf.format, "[C]ode [F]ormat")
    --
    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

--=============================================================================
-- CMP
--=============================================================================

local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
require("cmp_r").setup({})

luasnip.config.setup({})

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = { completeopt = "menu,menuone,noinsert" },

  -- Añade bordes a las ventanas de autocompletado
  -- window = {
  -- 	completion = cmp.config.window.bordered(),
  -- 	documentation = cmp.config.window.bordered(),
  -- },

  -- Añade texto a autocompletar despues del cursor
  experimental = {
    ghost_text = true,
  },
  -- For an understanding of why these mappings were
  -- chosen, you will need to read `:help ins-completion`
  --
  -- No, but seriously. Please read `:help ins-completion`, it is really good!
  mapping = cmp.mapping.preset.insert({
    -- Select the [n]ext item
    ["<C-n>"] = cmp.mapping.select_next_item(),
    -- Select the [p]revious item
    ["<C-p>"] = cmp.mapping.select_prev_item(),

    -- scroll the documentation window [b]ack / [f]orward
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),

    -- Accept ([y]es) the completion.
    --  This will auto-import if your LSP supports it.
    --  This will expand snippets if the LSP sent a snippet.
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),

    -- Manually trigger a completion from nvim-cmp.
    --  Generally you don't need this, because nvim-cmp will display
    --  completions whenever it has completion options available.
    ["<C-Space>"] = cmp.mapping.complete({}),

    -- Cancela autocompletado
    ["<C-e>"] = cmp.mapping.abort(),

    -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm({ select = true }),

    -- Think of <c-l> as moving to the right of your snippet expansion.
    --  So if you have a snippet that's like:
    --  function $name($args)
    --    $body
    --  end
    --
    -- <c-l> will move you to the right of each of the expansion locations.
    -- <c-h> is similar, except moving you backwards.
    ["<C-l>"] = cmp.mapping(function()
      if luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { "i", "s" }),
    ["<C-h>"] = cmp.mapping(function()
      if luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { "i", "s" }),

    --  Usa tab y S-tab para mover el menu
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,

    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,

    -- For more advanced luasnip keymaps (e.g. selecting choice nodes, expansion) see:
    --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
  }),

  -- Añade iconos a menu de autocompletado
  formatting = {
    fields = { "abbr", "kind", "menu" },
    expandable_indicator = true,
    format = lspkind.cmp_format({
      -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
      mode = "symbol_text",
      -- max_width = 50,
      symbol_map = { Copilot = "" },
    }),
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    { name = "buffer" },
    { name = "copilot", group_index = 1, priority = 100 },
    { name = "cmp_r" },
  },
})

--=============================================================================
-- Mason
--=============================================================================

require("mason").setup()
require("mason-tool-installer").setup({
  ensure_installed = {
    "stylua", -- Used to format lua code
    "hadolint", -- dockerfile
    "markdownlint", -- markdown
    "marksman",
    "js-debug-adapter",
    "prettier",
  },
})
require("mason-lspconfig").setup({
  -- handlers = {
  -- 	function(server_name)
  -- 		local server = servers[server_name] or {}
  -- 		-- This handles overriding only values explicitly passed
  -- 		-- by the server configuration above. Useful when disabling
  -- 		-- certain features of an LSP (for example, turning off formatting for tsserver)
  -- 		server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
  -- 		require("lspconfig")[server_name].setup(server)
  -- 	end,
  -- },
})

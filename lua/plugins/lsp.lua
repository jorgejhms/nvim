-- Capabilities nativas; los snippets los expande mini.snippets
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Diagnósticos: iconos en signos, punto en el virtual text, severidad ordenada
local severity = vim.diagnostic.severity
local icons = {
  [severity.ERROR] = " ",
  [severity.WARN] = " ",
  [severity.HINT] = " ",
  [severity.INFO] = " ",
}

vim.diagnostic.config({
  severity_sort = true,
  signs = { text = icons },
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = "●",
  },
})

-- Subrayado ondulado (conserva el color `sp` del tema); los temas reinician los highlights
local function curly_underlines()
  for _, name in ipairs({ "Error", "Warn", "Info", "Hint", "Ok" }) do
    local group = "DiagnosticUnderline" .. name
    local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
    vim.api.nvim_set_hl(0, group, { sp = hl.sp, undercurl = true })
  end
end
curly_underlines()
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("jorgejhms_curly_underlines", { clear = true }),
  callback = curly_underlines,
})

-- Definiendo funciones para 'ts_ls' por separado
local organize_imports_ts = function()
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      only = { "source.organizeImports.ts" },
      diagnostics = {},
    },
  })
end

local remove_unused_imports_ts = function()
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      only = { "source.removeUnused.ts" },
      diagnostics = {},
    },
  })
end

-- Atajos y comportamiento por buffer al conectarse un servidor
local on_attach = function(client, bufnr)
  local map = function(keys, func, desc)
    vim.keymap.set("n", keys, func, { noremap = true, silent = true, buffer = bufnr, desc = desc })
  end

  -- Atajos LSP
  map("gd", function() require("mini.extra").pickers.lsp({ scope = "definition" }) end, "Ir a la definición")
  map("gD", function() require("mini.extra").pickers.lsp({ scope = "declaration" }) end, "Ir a la declaración")
  map("gr", function() require("mini.extra").pickers.lsp({ scope = "references" }) end, "Ir a las declaración")
  map("gI", function() require("mini.extra").pickers.lsp({ scope = "implementation" }) end, "Ir a implemmentación")
  map(
    "<Leader>D",
    function() require("mini.extra").pickers.lsp({ scope = "type_definition" }) end,
    "Ir a definición de tipo"
  )
  map(
    "<Leader>ds",
    function() require("mini.extra").pickers.lsp({ scope = "document_symbol" }) end,
    "Ver los símbolos del docuento"
  )
  map(
    "<Leader>ws",
    function() require("mini.extra").pickers.lsp({ scope = "workspace_symbol" }) end,
    "Ver los símbolos del área de trabajo"
  )
  map("<leader>cr", vim.lsp.buf.rename, "Renombrar símbolo")
  map("<leader>ca", vim.lsp.buf.code_action, "Acciones de código")
  map("K", vim.lsp.buf.hover, "Ver documentación")
  map("<leader>cf", vim.lsp.buf.format, "Formatear código")
  map("<leader>cd", vim.diagnostic.open_float, "Mostrar los errores de diagnóstico")
  map("<leader>dq", vim.diagnostic.setloclist, "Open diagnostic [Q]uickfix list")
  -- Atajos específicos para 'ts_ls'
  if client.name == "ts_ls" then
    map("<leader>co", organize_imports_ts, "Organizar Imports")
    map("<leader>cR", remove_unused_imports_ts, "Eliminar Imports No Usados")
  end

  if client.name == "ruff" then
    map("<leader>co", function()
      vim.lsp.buf.code_action({
        apply = true,
        context = { only = { "source.organizeImports" }, diagnostics = {} },
      })
    end, "Organizar Imports")
  end

  -- Plegado por LSP cuando el servidor lo soporta (si no, queda foldmethod=indent)
  if client:supports_method("textDocument/foldingRange") then
    local win = vim.api.nvim_get_current_win()
    vim.wo[win][0].foldmethod = "expr"
    vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
  end

  -- Elimina el resaltado tras una búsqueda LSP
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("jorgejhms_lsp_attach", { clear = true }),
  callback = function(args)
    on_attach(vim.lsp.get_client_by_id(args.data.client_id), args.buf)
  end,
})

-- Configuración de servidores
local servers = {
  astro = {},
  css_variables = {},
  cssls = {},
  cssmodules_ls = {},
  docker_compose_language_service = {},
  dockerls = {},
  emmet_language_server = {},
  html = {},
  mdx_analyzer = {},

  -- Configuración para Lua
  -- (R se completa con el LSP propio de R.nvim, no con 'languageserver')
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
        diagnostics = {
          globals = { "vim" }, -- Reconoce vim como variable global
        },
        hint = { enable = true },
      },
    },
  },

  -- Python
  basedpyright = {},
  ruff = {},

  -- Taailwind CSS
  tailwindcss = {
    filetypes = vim.tbl_filter(
      function(ft) return ft ~= "markdown" end,
      vim.lsp.config.tailwindcss.filetypes
    ),
    settings = {
      tailwindCSS = { classFunctions = { "cva", "cx" } },
    },
  },

  -- typescript
  ts_ls = {
    settings = {
      completions = {
        completeFunctionCalls = true,
      },
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayVariableTypeHints = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayVariableTypeHints = true,

          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },
  -- Yaml
  yamlls = {
    -- Have to add this for yamlls to understand that we support line folding
    capabilities = {
      textDocument = {
        foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        },
      },
    },
    settings = {
      redhat = { telemetry = { enabled = false } },
      yaml = {
        keyOrdering = false,
        format = {
          enable = true,
        },
        validate = true,
      },
    },
  },

  eslint = {
    settings = {
      -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
      workingDirectories = { mode = "auto" },
    },
  },
}

-- Aplica configuración (nvim-lspconfig aporta las configs base en lsp/)
vim.lsp.config("*", { capabilities = capabilities })
for server, config in pairs(servers) do
  vim.lsp.config(server, config)
  vim.lsp.enable(server)
end

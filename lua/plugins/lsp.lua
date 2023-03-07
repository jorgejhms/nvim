-- Importa lspconfig de forma segura
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  print("Lspcinfig no está instalado")
  return
end

-- Importa cmp-nvim-lsp de forma segura
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  print("Cmp no está instalado")
  return
end

-- Importa cmp-nvim-lsp de forma segura
local navic_status, navic = pcall(require, "nvim-navic")
if not navic_status then
  print("Cmp no está instalado")
  return
end

local map = vim.keymap

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  navic.attach(client, bufnr)

  -- set keybinds
  -- map.set('n', 'gD', vim.lsp.buf.declaration, opts)
  -- map.set('n', 'gd', vim.lsp.buf.definition, opts)
  -- map.set('n', 'K', vim.lsp.buf.hover, opts)
  -- map.set('n', '<leader>dk', vim.diagnostic.open_float, opts)
  -- map.set('n', 'gi', vim.lsp.buf.implementation, opts)
  -- map.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  -- map.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  -- map.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  -- map.set('n', '<space>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, opts)
  -- map.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  -- map.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  -- map.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
  -- map.set('n', 'gr', vim.lsp.buf.references, opts)
  -- map.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
end

local capabilities = cmp_nvim_lsp.default_capabilities()

-- Signos de diagnosticos
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Configuración servidores

local lsp_servers = {
  "astro",
  "cssls",
  "dockerls",
  "emmet_ls",
  "eslint", -- javascript
  "html",
  "jsonls",
  "lua-ls",
  "phpactor",
  "pyright",
  "r_language_server",
  "tailwindcss",
  "tsserver",
  "vimls",
  "yamlls"
}

for _, server in ipairs(lsp_servers) do
  lspconfig[server].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
  }
end

-- Configuración espacífica para lua
-- lspconfig["sumneko_lua"].setup {
--   capabilities = capabilities,
--   on_attach = on_attach,
--   flags = {
--     debounce_text_changes = 150,
--   },
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { 'vim' }, -- Get the language server to recognize the `vim` global
--       },
--       workspace = {
--         library = vim.api.nvim_get_runtime_file("", true), -- Make the server aware of Neovim runtime files
--       },
--       telemetry = {
--         enable = false, -- Do not send telemetry data containing a randomized but unique identifier
--       },
--     },
--   },
-- }

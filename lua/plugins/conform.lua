require("conform").setup({
  notify_on_error = true,
  -- Sin formateador propio (p. ej. Python) se usa el LSP (ruff)
  format_on_save = { timeout_ms = 1000, lsp_format = "fallback" },
  formatters_by_ft = {
    lua = { "stylua" },
    ["javascript"] = { "prettier" },
    ["javascriptreact"] = { "prettier" },
    ["typescript"] = { "prettier" },
    ["typescriptreact"] = { "prettier" },
    ["vue"] = { "prettier" },
    ["css"] = { "prettier" },
    ["scss"] = { "prettier" },
    ["less"] = { "prettier" },
    ["html"] = { "prettier" },
    ["json"] = { "prettier" },
    ["jsonc"] = { "prettier" },
    ["yaml"] = { "prettier" },
    ["markdown"] = { "prettier" },
    ["graphql"] = { "prettier" },
    ["handlebars"] = { "prettier" },
    ["astro"] = { "prettier" },
  },
})

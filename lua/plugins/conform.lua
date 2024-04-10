require("conform").setup {
  notify_on_error = true,
  -- FIXME: Verficar el funcionamiento de este comando
  -- format_on_save = function(bufnr)
  -- 	-- Disable "format_on_save lsp_fallback" for languages that don't
  -- 	-- have a well standardized coding style. You can add additional
  -- 	-- languages here or re-enable it for the disabled ones.
  -- 	local disable_filetypes = { c = true, cpp = true }
  -- 	return {
  -- 		timeout_ms = 500,
  -- 		lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
  -- 	}
  -- end,
  format_on_save = true,
  -- NOTE: Aquí se agregan los formateadores que se deseen
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
    ["markdown.mdx"] = { "prettier" },
    ["graphql"] = { "prettier" },
    ["handlebars"] = { "prettier" },
    ["astro"] = { "prettier" },

  }
}

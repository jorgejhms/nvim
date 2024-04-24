--[[

  ==============================================================================
  Autocomandos
  Revisar `:help lua-guide-autocommands`
  ==============================================================================

]]

-- Restalta el texto copiado (yank)
--  Revisar `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Resalta el texto copiado (yank)",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

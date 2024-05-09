--[[

  ==============================================================================
  Autocomandos
  Revisar `:help lua-guide-autocommands`
  ==============================================================================

]]
local function augroup(name)
  return vim.api.nvim_create_augroup("jorgejhms_" .. name, { clear = true })
end

-- Restalta el texto copiado (yank)
--  Revisar `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Resalta el texto copiado (yank)",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

local function augroup(name)
  return vim.api.nvim_create_augroup("jorgejhms_" .. name, { clear = true })
end

-- Redimenciona splits al cambiar tamaño de la ventana
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Oculta mini.tabline si solo hay un buffer abierto
-- https://github.com/echasnovski/mini.nvim/issues/433
vim.api.nvim_create_autocmd("BufEnter", {
  callback = vim.schedule_wrap(function()
    local n_listed_bufs = 0
    for _, buf_id in ipairs(vim.api.nvim_list_bufs()) do
      if vim.fn.buflisted(buf_id) == 1 then
        n_listed_bufs = n_listed_bufs + 1
      end
    end

    vim.o.showtabline = n_listed_bufs > 1 and 2 or 0
  end),
  desc = "Update tabline based on the number of listed buffers",
})

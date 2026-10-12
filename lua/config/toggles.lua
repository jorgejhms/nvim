local map = vim.keymap.set

local function notify_state(name, enabled)
  vim.notify(name .. ": " .. (enabled and "activado" or "desactivado"))
end

local function toggle_option(key, option, scope)
  map("n", "<Leader>u" .. key, function()
    scope[option] = not scope[option]
    notify_state(option, scope[option])
  end, { desc = "Alterna '" .. option .. "'" })
end

toggle_option("c", "cursorline", vim.wo)
toggle_option("i", "ignorecase", vim.o)
toggle_option("l", "list", vim.wo)
toggle_option("n", "number", vim.wo)
toggle_option("r", "relativenumber", vim.wo)
toggle_option("s", "spell", vim.wo)
toggle_option("w", "wrap", vim.wo)

map("n", "<Leader>ub", function()
  vim.o.background = vim.o.background == "dark" and "light" or "dark"
  vim.notify("background: " .. vim.o.background)
end, { desc = "Alterna 'background'" })

map("n", "<Leader>ud", function()
  MiniBasics.toggle_diagnostic()
  notify_state("diagnostic", vim.diagnostic.is_enabled({ bufnr = 0 }))
end, { desc = "Alterna diagnósticos" })

map("n", "<Leader>uh", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  notify_state("inlay hints", vim.lsp.inlay_hint.is_enabled())
end, { desc = "Alterna pistas en línea de LSP" })

map("n", "<Leader>um", function()
  MiniMap.toggle()
  notify_state("minimapa", MiniMap.current.win_data[vim.api.nvim_get_current_tabpage()] ~= nil)
end, { desc = "Alterna el minimapa" })

map("n", "<Leader>uM", function() MiniMap.toggle_focus() end, { desc = "Enfoca el minimapa" })

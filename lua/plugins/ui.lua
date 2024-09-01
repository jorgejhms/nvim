-- [[
-- ============================================================================
-- Configuración de la interfaz de usuario
-- ============================================================================
-- ]]
local add = MiniDeps.add

-- add("stevearc/dressing.nvim")

-- Notificaciones -------------------------------------------------------------
require("mini.notify").setup()
vim.notify = MiniNotify.make_notify()

require("mini.starter").setup() -- Pantalla inicial
-- require("dressing").setup()
require("plugins.colors") -- Temas de colores
require("mini.statusline").setup()

-- Gestión de sesiones
require("mini.sessions").setup({
  autowrite = true,
})

require("mini.tabline").setup({
  tabpage_section = "right",
})

-- Keyamps
local map = vim.keymap.set

map("n", "<Leader>mnh", "<cmd>lua MiniNotify.show_history()<CR>", { desc = "Show notification history" })
map("n", "<Leader>mna", "<cmd>lua MiniNotify.get_all()<CR>", { desc = "Show all notifications" })
map("n", "<Leader>mnc", "<cmd>lua MiniNotify.clear()<CR>", { desc = "Clear all notifications" })

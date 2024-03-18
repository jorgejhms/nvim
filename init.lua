--[[

  =============================================================================
  MINIMAL.NVIM
  Configuración personal Neovim
  =============================================================================

--]]

require("config.options") -- Opciones generales
require("config.maps") -- Keymaps
require("config.autocomands") -- Keymaps
require("config.lazy") -- Lazy.nvim

vim.cmd.colorscheme("dracula")

--[[

  =============================================================================
  MINIMAL.NVIM
  Configuración personal Neovim
  =============================================================================

--]]

require("config.options") -- Opciones generales
require("config.maps") -- Keymaps
require("config.autocomands") -- autocomands
require("config.plugins") -- Mini.nvim
-- require("config.lazy") -- Lazy.nvim

vim.cmd.colorscheme("tokyonight")

-- Plugins config
require("plugins.colors")
require("plugins.conform")
require("plugins.copilot")
require("plugins.flash")
require("plugins.gitsigns")
require("plugins.lsp")
require("plugins.mini")
require("plugins.telescope")
require("plugins.toggleterm")
require("plugins.transparent")
require("plugins.trouble")
require("plugins.nvim-treesitter")

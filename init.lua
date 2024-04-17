--[[

  =============================================================================

     ██╗ ██████╗ ██████╗  ██████╗ ███████╗     ██╗██╗  ██╗███╗   ███╗███████╗
     ██║██╔═══██╗██╔══██╗██╔════╝ ██╔════╝     ██║██║  ██║████╗ ████║██╔════╝
     ██║██║   ██║██████╔╝██║  ███╗█████╗       ██║███████║██╔████╔██║███████╗
██   ██║██║   ██║██╔══██╗██║   ██║██╔══╝  ██   ██║██╔══██║██║╚██╔╝██║╚════██║
╚█████╔╝╚██████╔╝██║  ██║╚██████╔╝███████╗╚█████╔╝██║  ██║██║ ╚═╝ ██║███████║
 ╚════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝ ╚════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝

  MINIMAL.NVIM
  Configuración personal Neovim
	jorgejhms@gmail.com
  =============================================================================

--]]

require("config.options") -- Opciones generales
require("config.maps") -- Keymaps
require("config.autocomands") -- autocomands
require("config.plugins") -- Mini.nvim

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
require("plugins.trouble")
require("plugins.nvim-treesitter")

-- Tema por defecto
vim.cmd.colorscheme("dracula")

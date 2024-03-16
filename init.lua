--[[

  ==============================================================================
  Configuración personal Neovim
  autor: jorgejhms
  ==============================================================================

--]]

-- Establece <space> como leader
vim.g.mapleader = " " -- Usa espacio como tecla leader
vim.g.maplocalleader = "\\" -- Usa \ como local leader

vim.g.have_nerd_font = true -- Nerd font

-- Carga opciones generales
require("config.options")
require("config.maps")
require("config.autocomands")

-- Carga Lazu.nvim para gestión de paquetes
require("config.lazy")

-- Selecciona tema de colores
vim.cmd.colorscheme("catppuccin")

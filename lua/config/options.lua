--==============================================================================
-- Opciones generales
-- Revisar `:help options` para más información
--==============================================================================

-- Oculta command line si no se usa
vim.opt.cmdheight = 0

-- Establece <space> como leader
-- See `:help mapleader`
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- Establece números de línea relativos
vim.opt.number = true
vim.opt.relativenumber = true

-- Siempre muestra el tabline
-- vim.opt.showtabline = 3

-- Activa el soporte del mouse
vim.opt.mouse = "a"

-- No muestra el modo de edición
vim.opt.showmode = false

--  Sincroniza el portapapeles con el sistema
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Indentación
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true

-- Code folding with treesitter
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Guarda el historial de "deshacer"
vim.opt.undofile = true

-- Busqueda insensible a mayúsculas y minúsculas
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Establece columna de signos
vim.opt.signcolumn = "yes"

-- Reduce el tiempo de actualización
vim.opt.updatetime = 250

-- Reduce el tiempo de espera de secuencias mapeadas
vim.opt.timeoutlen = 300

-- Condigura como se abren los splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 3

-- resalta pares de parentesis
vim.opt.showmatch = true

-- tabs & indent
vim.opt.tabstop = 2 -- 2 espacios como tab
vim.opt.shiftwidth = 2 -- 2 espacios ancho de tab

-- Spell checking
-- vim.opt.spell = true
-- vim.opt.spelllang = "es"
--
-- Wrap por defecto
vim.opt.wrap = true

-- No usa swapfiles
vim.opt.swapfile = false

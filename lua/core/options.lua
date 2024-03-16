local opt = vim.opt

-- General options
opt.syntax = "yes"
opt.fileencoding = "utf8"
opt.signcolumn = "yes"
opt.showmatch = true -- resalta pares de parentesis
opt.errorbells = false -- desactiva campana de errores
opt.laststatus = 3 -- statusline global
opt.colorcolumn = "80" -- guia en la columna 80
opt.clipboard = "unnamed" -- usar el clipboard del sistema
opt.showmode = false -- no muestra el modo de forma duplicada
opt.showtabline = 2 -- muestra la linea de tabs
opt.swapfile = false -- no usa archivos temporales
opt.scrolloff = 8 -- deja 8 lineas de espacio en el scroll
opt.lazyredraw = true
opt.updatetime = 250
opt.mouse = "a"
opt.hidden = true
opt.termguicolors = true
opt.cursorline = true
opt.cmdheight = 0

-- Line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indent
opt.tabstop = 2 -- 4 espacios como tab
opt.shiftwidth = 2 -- 4 espacios ancho de tab
opt.expandtab = true -- cambia tabs a espacios
opt.autoindent = true -- inserta tabs de forma automática
opt.smartindent = true -- inserta tabs en base a sintaxis

-- line wraping
opt.wrap = true
opt.linebreak = true
opt.textwidth = 0

-- Búsqueda
opt.hlsearch = true -- resalta resultados búsqueda
opt.ignorecase = true -- ignora mayus/minus en búsqueda
opt.smartcase = true -- busqueda inteligente
opt.incsearch = true -- busqueda incremental

-- Corrección ortográfica en archivos markdown
vim.cmd[[autocmd BufNewFile,BufRead *.md set spell spelllang=es]]

-- Desactiva folds en markdown
vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0
vim.g['conceallevel'] = 0

-- vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
vim.g.transparent_enabled = true

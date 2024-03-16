--[[

  ==============================================================================
  Opciones generales
  ==============================================================================

  Revisar `:help vim.opt` para más información
]]

-- Establece numeros relativos de línea
vim.opt.relativenumber = true
vim.opt.number = true

-- Activa mouse
vim.opt.mouse = "a"

-- No muestra el modo de forma duplicada
vim.opt.showmode = false

-- Sincroniza con el portapapeles del sistema
-- Revisar `:help clipboard`
vim.opt.clipboard = "unnamed"

-- Activa breakindent. Preserva indentación en líneas largas
vim.opt.breakindent = true

-- Preserva historial de deshacer
vim.opt.undofile = true

-- Búsqueda
vim.opt.hlsearch = true  -- resalta resultados búsqueda
vim.opt.incsearch = true -- busqueda incremental
-- Ignora mayusculas/minusculas en búsqueda a menos que se use mayuscula o \C
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Usar un statusline global.
vim.opt.laststatus = 3

-- resalta pares de parentesis
vim.opt.showmatch = true

-- guia en la columna 80
vim.opt.colorcolumn = "80"

-- no usa archivos temporales
vim.opt.swapfile = false

vim.opt.termguicolors = true

vim.opt.cursorline = true
vim.opt.cmdheight = 0

-- tabs & indent
vim.opt.tabstop = 2        -- 2 espacios como tab
vim.opt.shiftwidth = 2     -- 2 espacios ancho de tab
vim.opt.expandtab = true   -- cambia tabs a espacios
vim.opt.autoindent = true  -- inserta tabs de forma automática
vim.opt.smartindent = true -- inserta tabs en base a sintaxis

-- line wraping
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.textwidth = 0

-- Corrección ortográfica en archivos markdown
-- vim.cmd [[autocmd BufNewFile,BufRead *.md set spell spelllang=es]]

-- Desactiva folds en markdown
-- vim.g.vim_markdown_folding_disabled = 1
-- vim.g.vim_markdown_conceal = 0
-- vim.g.vim_markdown_conceal_code_blocks = 0
-- vim.g['conceallevel'] = 0

-- vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
-- vim.g.transparent_enabled = true

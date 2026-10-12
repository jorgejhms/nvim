-- [[ Autocompletado con mini.completion + mini.snippets ]]

-- Fuzzy matching nativo en el popup (si se define antes del setup,
-- mini.completion no lo sobreescribe con su "menuone,noselect")
vim.o.completeopt = "menuone,noselect,fuzzy,nosort"
vim.o.complete = ".,w,b,kspell" -- Menos fuentes de completado nativo
vim.o.completetimeout = 100 -- Limita la espera de las fuentes (ms)
vim.o.pumborder = "rounded" -- Borde del menú, igual que 'winborder'
vim.o.pummaxwidth = 100 -- Menú no demasiado ancho

-- Completado LSP asíncrono con fallback a palabras del buffer.
-- Por defecto: <C-Space> fuerza completado, <C-f>/<C-b> scrollean docs,
-- <CR> acepta el item (e inicia sesión de snippet si lo es), <C-e> cancela.
require("mini.completion").setup({})

-- Motor de snippets: carga friendly-snippets según el lenguaje del buffer.
-- Defaults: <C-j> expande, <C-l>/<C-h> saltan tabstops, <C-c> termina sesión.
local gen_loader = require("mini.snippets").gen_loader
require("mini.snippets").setup({
	snippets = {
		gen_loader.from_lang(),
	},
})

-- Expone los snippets de friendly-snippets dentro del menú de mini.completion
-- (match = false: deja el filtrado al motor de completado)
require("mini.snippets").start_lsp_server({ match = false })

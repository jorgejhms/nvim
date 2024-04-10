--[[

  ==============================================================================
  Keymaps
  ==============================================================================

  Revisar `:help vim.keymap.set()`

]]

local map = vim.keymap.set

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Usa <Esc><Esc> para salir de la terminal
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Ajuste "arriba"/"abajo" para lineas visuales
-- map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Movimiento de líneas, similares a VSCode. Requiere activación de uso de alt en
-- MacOS
map("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
map("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Splits
-- ver `help: split`
map("n", "<leader>|", ":vsplit<cr>")
map("n", "<leader>-", ":split<cr>")

-- Cambia tamaño de ventanas usando <option> + flechas
map("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Movimiento buffers
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Buffer anterior" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Buffer siguiente" })
map("n", "<leader>b1", "<cmd>bfirst<cr>", { desc = "Ir al primer buffer" })
map("n", "<leader>b9", "<cmd>blast<cr>", { desc = "Ir al último buffer" })
map("n", "<leader>bd", "<cmd>lua MiniBufremove.delete()<cr>", { desc = "Borrar buffer" })

-- Comando para cerrar otros buffers
vim.cmd([[
command! BufOnly silent! execute "%bd|e#|bd#"
]])
map("n", "<leader>bo", "<cmd>BufOnly<cr>", { desc = "Cerrar todos los buffers" })

-- Limpia busqueda con <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Limpiar búsqueda" })

-- Usa Telescope para las sugerencias ortográficas
map("n", "z=", ":Telescope spell_suggest<cr>")

vim.cmd([[
function! NumberToggle()
    if(&number == 1)
        set number!
        set relativenumber!
    elseif(&relativenumber==1)
        set relativenumber
        set number
    else
        set norelativenumber
        set number
    endif
endfunction
]])

-- Cambios de interfaz de usuario
-- map("n", "<leader>uz", ":Goyo<cr>", {desc="Modo Zen"})
map(
  "n",
  "<leader>un",
  ":call NumberToggle()<cr>",
  { noremap = true, silent = true, desc = "Alterna numeros de línea" }
)
map("n", "<leader>uw", ":set wrap!<cr>", { noremap = true, silent = true, desc = "Alterna ajuste de línea" })
-- map("n", "<leader>ug", ":GitBlameToggle<cr>", { noremap = true, silent = true, desc = "Alterna GitBlame" })
-- map("n", "<leader>ut", ":TransparentToggle<cr>", { noremap = true, silent = true, desc = "Alterna fondo transpaente" })
-- map(
-- 	"n",
-- 	"<leader>ui",
-- 	":IndentBlanklineToggle!<cr>",
-- 	{ noremap = true, silent = true, desc = "Alterna guias de indentación" }
-- )

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Lazy
map("n", "<leader>l", ":Lazy<cr>", { desc = "Abre Lazy.vim" })

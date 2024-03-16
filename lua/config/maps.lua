--[[

  ==============================================================================
  Mappings
  ==============================================================================

  Revisar `:help vim.keymap.set()`

]]

local map = vim.keymap.set

-- Ajuste "arriba"/"abajo" para lineas visuales
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Moviento de líneas, similares a VSCode. Requiere activación de uso de alt en
-- MacOS
map('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
map('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true })
map('v', '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })
map('v', '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })

-- Movimiento de cursor entre palabras con <option>
map('', '<A-h>', 'b', { noremap = true, silent = true })
map('', '<A-l>', 'e', { noremap = true, silent = true })
map('i', '<A-h>', '<Esc>bi', { noremap = true, silent = true })
map('i', '<A-l>', '<Esc>wwi', { noremap = true, silent = true })

-- Movimiento de ventanas usando <ctrl> + hjkl
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Salir del modo terminal
map("t", "<Esc><Esc>", "<c-\\><c-n>", { desc = "Salir del modo terminal" })

-- Splits
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
--map("n", "<leader>bd", "<cmd>bdelete<cr>", {desc = "Cerrar Buffer"})

-- Limpia busqueda con <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Limpiar búsqueda" })

-- Abre archivos
map("n", "<leader>e", "<cmd>Neotree toggle<cr>")

-- Abre Lazygit
map("n", "<leader>gg", ":LazyGit<cr>")

-- Usa Telescope para las sugerencias ortográficas
map("n", "z=", ":Telescope spell_suggest<cr>")

vim.cmd [[
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
]]


-- Cambios de interfaz de usuario
-- map("n", "<leader>uz", ":Goyo<cr>", {desc="Modo Zen"})
map("n", "<leader>un", ":call NumberToggle()<cr>", { noremap = true, silent = true, desc = "Alterna numeros de línea" })
map("n", "<leader>uw", ":set wrap!<cr>", { noremap = true, silent = true, desc = "Alterna ajuste de línea" })
map("n", "<leader>ug", ":GitBlameToggle<cr>", { noremap = true, silent = true, desc = "Alterna GitBlame" })
map("n", "<leader>ut", ":TransparentToggle<cr>", { noremap = true, silent = true, desc = "Alterna fondo transpaente" })
map("n", "<leader>ui", ":IndentBlanklineToggle!<cr>",
  { noremap = true, silent = true, desc = "Alterna guias de indentación" })

-- Movimientos de terminal
map("n", "<leader>t", "<cmd>exe v:count1 .. 'ToggleTerm'<cr>", { silent = true })
map("n", "<leader>th", "<cmd>exe v:count1 .. 'ToggleTerm direction=horizontal'<cr>", { silent = true })
map("n", "<leader>tv", "<cmd>exe v:count1 .. 'ToggleTerm direction=vertical size=80'<cr>", { silent = true })
map("n", "<leader>tf", "<cmd>exe v:count1 .. 'ToggleTerm direction=float'<cr>", { silent = true })
map("n", "<leader>tt", "<cmd>exe v:count1 .. 'ToggleTerm direction=tab'<cr>", { silent = true })
map("n", "<leader>ta", ":ToggleTermToggleAll<cr>", { silent = true })


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

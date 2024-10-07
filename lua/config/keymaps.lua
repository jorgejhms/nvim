local map = vim.keymap.set

-- Recarga configuración
map("n", "<Leader>rr", function()
		vim.cmd("source $MYVIMRC")
		vim.notify("Configuración de NVIM recargada", INFO, { title = "Neovim" })
	end,
	{ desc = "Recargar configuración NVIM" }
)

-- Establece resaltado durante búsquedas, limpia usando <Esc> en modo normal
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Usa <Esc><Esc> para salir de la terminal
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Splits
-- ver `help: split`
map("n", "<leader>|", ":vsplit<cr>")
map("n", "<leader>-", ":split<cr>")

-- Buffers
map("n", "<leader>bd", "<cmd>lua MiniBufremove.delete()<cr>", { desc = "Borrar buffer" })

-- Comando para cerrar otros buffers
vim.cmd([[
	command! BufOnly silent! execute "%bd|e#|bd#"
]])
map("n", "<leader>bo", "<cmd>BufOnly<cr>", { desc = "Cerrar todos los buffers" })

-- Tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

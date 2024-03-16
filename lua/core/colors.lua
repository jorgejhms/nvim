local status, _ = pcall(vim.cmd, "colorscheme dracula")
if not status then
	print("Error: Color no encontrado") -- print error if colorscheme not installed
	return
end

-- Activa parentesis de colores
vim.cmd 'let g:rainbow_active = 1'

-- Fix para terminal Kitty
vim.cmd [[let &t_ut='']]

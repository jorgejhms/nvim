-- Lista de parsers a instalar (y filetypes con features de treesitter)
local ensure_installed = {
	"bash",
	"c",
	"dockerfile",
	"html",
	"json",
	"json5",
	"lua",
	"markdown",
	"markdown_inline",
	"ninja",
	"python",
	"r",
	"rnoweb",
	"rst",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
}

-- nvim-treesitter 1.x: instala los parsers que falten (no-op si ya están)
require("nvim-treesitter").install(ensure_installed)

local augroup = vim.api.nvim_create_augroup("treesitter-config", { clear = true })

-- Resaltado: en 1.x lo activa el propio Neovim con vim.treesitter.start()
-- El parser "vimdoc" corresponde al filetype "help"
local highlight_ft = vim.list_extend({ "help" }, ensure_installed)
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = highlight_ft,
	callback = function(args)
		-- pcall: evita error si el parser aún no terminó de instalarse
		pcall(vim.treesitter.start, args.buf)
	end,
})

-- Activa el resaltado en buffers ya abiertos (su FileType ya se disparó
-- antes de que este archivo se cargue dentro del later() de mini.deps)
for _, buf in ipairs(vim.api.nvim_list_bufs()) do
	if vim.api.nvim_buf_is_loaded(buf) and vim.tbl_contains(highlight_ft, vim.bo[buf].filetype) then
		pcall(vim.treesitter.start, buf)
	end
end

-- Indentación con treesitter (experimental en 1.x)
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = ensure_installed,
	callback = function(args)
		vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

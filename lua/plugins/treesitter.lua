local ensure_installed = {
	"bash",
	"c",
	"dockerfile",
	"html",
	"json",
	"json5",
	"jsonc",
	"lua",
	"markdown",
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

require("nvim-treesitter.configs").setup({
	ensure_installed = ensure_installed,
	highlight = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-space>",
			node_incremental = "<C-space>",
			scope_incremental = false,
			node_decremental = "<bs>",
		},
	},
	indent = { enable = true },
})

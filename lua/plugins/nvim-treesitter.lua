return { -- Highlight, edit, and navigate code
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"dockerfile",
				"html",
				"lua",
				"markdown",
				"vim",
				"vimdoc",
				"json",
				"json5",
				"jsonc",
				"markdown",
				"markdown_inline",
				"ninja",
				"python",
				"rst",
				"toml",
				"typescript",
				"tsx",
				"yaml",
			},
			-- Autoinstall languages that are not installed
			auto_install = true,
			highlight = {
				enable = true,
				-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
				--  If you are experiencing weird indenting issues, add the language to
				--  the list of additional_vim_regex_highlighting and disabled languages for indent.
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		},
		config = function(_, opts)
			-- [[ Configure Treesitter ]] See `:help nvim-treesitter`

			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup(opts)

			-- There are additional nvim-treesitter modules that you can use to interact
			-- with nvim-treesitter. You should go explore a few and see what interests you:
			--
			--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
			--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
			--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		end,
	},

	-- Muestra el contexto del cursor
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "VeryLazy",
		enabled = true,
		opts = { mode = "cursor", max_lines = 3 },
	},

	-- Completa y renombra etiquetas HTML
	{
		"windwp/nvim-ts-autotag",
		event = "VeryLazy",
		opts = {},
	},

	-- Genera comentarios de acuerdo al contexto
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
		opts = {
			enable_autocmd = false,
		},
	},
}

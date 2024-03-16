-- Telescope
-- https://github.com/nvim-telescope/telescope.nvim
return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	event = "VimEnter", -- Carga después de que Vim esté listo
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		-- Estable vim.ui.select a Telescope
		-- https://github.com/nvim-telescope/telescope-ui-select.nvim
		{ "nvim-telescope/telescope-ui-select.nvim" },
		-- Useful for getting pretty icons, but requires a Nerd Font.
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	opts = {
		pickers = {
			find_files = {
				find_command = { "rg", "-L", "--files" }, --Include soft links
			},
		},
	},
	keys = {
		{ "<leader><leader>", "<cmd>Telescope find_files<cr>", desc = "Buscar archivos" },
		{ "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Buscar en archivos (grep)" },
		{ "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Historial de comandos" },
		-- Busqueda general ([f]ind)
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Buscar archivos" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers abiertos" },
		{ "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Archivos de git" },
		{ "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Comandos" },
		{ "<leader>sd", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Símbolos del documento" },
		{
			"<leader>sD",
			"<cmd>Telescope lsp_workspace_symbols<cr>",
			desc = "Símbolos del espacio de trabajo",
		},
		--Busqueda Git ([g]it)
		{ "<leader>gb", "<cmd>Telescope git_branches<CR>", desc = "branches" },
		{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
		{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
		-- Otras busquedas ([s]earch)
		{ '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
		{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Tags de ayuda" },
		{ "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
		{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
		{ "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
		{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
		{ "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
		{ "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
		{ "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
		{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
		{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
		{ "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
		{ "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
		{ "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
		{
			"<leader>ss",
			function()
				require("telescope.builtin").lsp_document_symbols({
					symbols = require("lazyvim.config").get_kind_filter(),
				})
			end,
			desc = "Goto Symbol",
		},
		{
			"<leader>sS",
			function()
				require("telescope.builtin").lsp_dynamic_workspace_symbols({
					symbols = require("lazyvim.config").get_kind_filter(),
				})
			end,
			desc = "Goto Symbol (Workspace)",
		},
	},
}

local lspconfig = require("lspconfig")
local capabilities = require'cmp_nvim_lsp'.default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Signos de diagnosticos
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


-- Definiendo función on_attach
local on_attach = function(client, bufnr)
	local map = function(keys, func, desc)
		vim.keymap.set("n", keys, func, { noremap = true, silent = true, buffer = bufnr, desc = desc })
	end

	-- Atajos LSP
	map("gd", function() require("mini.extra").pickers.lsp({ scope = "definition" }) end, "Ir a la definición")
	map("gD", function() require("mini.extra").pickers.lsp({ scope = "declaration" }) end, "Ir a la declaración")
	map("gr", function() require("mini.extra").pickers.lsp({ scope = "references" }) end, "Ir a las declaración")
	map("gI", function() require("mini.extra").pickers.lsp({ scope = "implementation" }) end, "Ir a implemmentación")
	map("<Leader>D", function() require("mini.extra").pickers.lsp({ scope = "type_definition" }) end,
		"Ir a definición de tipo")
	map(
		"<Leader>ds",
		function() require("mini.extra").pickers.lsp({ scope = "document_symbol" }) end,
		"Ver los símbolos del docuento"
	)
	map(
		"<Leader>ws",
		function() require("mini.extra").pickers.lsp({ scope = "workspace_symbol" }) end,
		"Ver los símbolos del área de trabajo"
	)
	map("<leader>cr", vim.lsp.buf.rename, "Renombrar símbolo")
	map("<leader>ca", vim.lsp.buf.code_action, "Acciones de código")
	map("K", vim.lsp.buf.hover, "Ver documentación")
	map("<leader>cf", vim.lsp.buf.format, "Formatear código")
	map("<leader>cd", vim.diagnostic.open_float, "Mostrar los errores de diagnóstico")
	map("<leader>dq", vim.diagnostic.setloclist, "Open diagnostic [Q]uickfix list")
	map(
		"<Leader>uh",
		"<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>",
		"Alterna pistas en línea de LSP"
	)

	-- Elimina el resaltado tras una búsqueda LSP
	if client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})

		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end
end
--
-- Configuración de servidores
local servers = {
	astro = {},
	css_variables = {},
	cssls = {},
	cssmodules_ls = {},
	docker_compose_language_service = {},
	dockerls = {},
	emmet_language_server = {},
	emmet_ls = {},
	html = {},
	mdx_analyzer = {},
	r_language_server = {},

	-- Configuración para Lua
	lua_ls = {
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
				diagnostics = {
					globals = { "vim" }, -- Reconoce vim como variable global
				},
				hint = { enable = true },
			},
		},
	},

	-- Python
	pyright = {},
	ruff_lsp = {
		keys = {
			{
				"<leader>co",
				function()
					vim.lsp.buf.code_action({
						apply = true,
						context = {
							only = { "source.organizeImports" },
							diagnostics = {},
						},
					})
				end,
				desc = "Organize Imports",
			},
		},
	},

	-- Taailwind CSS
	tailwindcss = {
		filetypes_exclude = { "markdown" },
		filetypes_include = {},
	},

	-- typescript
	ts_ls = {
		hint = { enable = true },
		keys = {
			{
				"<leader>co",
				function()
					vim.lsp.buf.code_action({
						apply = true,
						context = {
							only = { "source.organizeImports.ts" },
							diagnostics = {},
						},
					})
				end,
				desc = "Organize Imports",
			},
			{
				"<leader>cR",
				function()
					vim.lsp.buf.code_action({
						apply = true,
						context = {
							only = { "source.removeUnused.ts" },
							diagnostics = {},
						},
					})
				end,
				desc = "Remove Unused Imports",
			},
		},
		---@diagnostic disable-next-line: missing-fields
		settings = {
			completions = {
				completeFunctionCalls = true,
			},
			typescript = {
				inlayHints = {
					includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayVariableTypeHints = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHintsWhenTypeMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
			},
			javascript = {
				inlayHints = {
					includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayVariableTypeHints = true,

					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHintsWhenTypeMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
			},
		},
	},
	-- Yaml
	yamlls = {
		-- Have to add this for yamlls to understand that we support line folding
		capabilities = {
			textDocument = {
				foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly = true,
				},
			},
		},
		-- lazy-load schemastore when needed
		on_new_config = function(new_config)
			new_config.settings.yaml.schemas =
					vim.tbl_deep_extend("force", new_config.settings.yaml.schemas or {}, require("schemastore").yaml.schemas())
		end,
		settings = {
			redhat = { telemetry = { enabled = false } },
			yaml = {
				keyOrdering = false,
				format = {
					enable = true,
				},
				validate = true,
				schemaStore = {
					-- Must disable built-in schemaStore support to use
					-- schemas from SchemaStore.nvim plugin
					enable = false,
					-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
					url = "",
				},
			},
		},
	},

	eslint = {
		settings = {
			-- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
			workingDirectories = { mode = "auto" },
		},
	},
}

-- Aplica configuración
for server, settings in pairs(servers) do
	lspconfig[server].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = settings,
	})
end

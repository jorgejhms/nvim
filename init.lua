--[[

  =============================================================================

     ██╗ ██████╗ ██████╗  ██████╗ ███████╗     ██╗██╗  ██╗███╗   ███╗███████╗
     ██║██╔═══██╗██╔══██╗██╔════╝ ██╔════╝     ██║██║  ██║████╗ ████║██╔════╝
     ██║██║   ██║██████╔╝██║  ███╗█████╗       ██║███████║██╔████╔██║███████╗
██   ██║██║   ██║██╔══██╗██║   ██║██╔══╝  ██   ██║██╔══██║██║╚██╔╝██║╚════██║
╚█████╔╝╚██████╔╝██║  ██║╚██████╔╝███████╗╚█████╔╝██║  ██║██║ ╚═╝ ██║███████║
 ╚════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝ ╚════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝

  MINIMAL.NVIM
  Configuración personal Neovim
	jorgejhms@gmail.com
  =============================================================================

--]]

-- Clona mini.nvim si no está instalado
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/echasnovski/mini.nvim",
    mini_path,
  }
  vim.fn.system(clone_cmd)
  vim.cmd("packadd mini.nvim | helptags ALL")
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Inicializa mini.nvim
require("mini.deps").setup({ path = { package = path_package } })

-- Agrega helpers
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- =============================================================================
-- Carga inicial
-- =============================================================================

-- stylua: ignore start
now(function() require("config.options") end) -- Opciones generales
now(function() require("config.maps") end) -- Keymaps
-- stylua: ignore end

-- Notificaciones
now(function()
  require("mini.notify").setup()
  vim.notify = MiniNotify.make_notify()
end)

-- stylua: ignore start
now(function() require("mini.starter").setup() end) -- Pantalla inicial
now(function() require("mini.sessions").setup() end) -- Gestión de sesiones
now(function() require("plugins.colors") end) -- Temas de colores
now(function() add("nvim-lua/plenary.nvim") end)
now(function() add("nvim-tree/nvim-web-devicons") end) -- Iconos

-- stylua: ignore end

now(function()
  require("mini.statusline").setup({
    use_icons = vim.g.have_nerd_font,
  })
end)

now(function()
  require("mini.tabline").setup({
    tabpage_section = "right",
  })
end)

-- =============================================================================
-- Carga posterior (Lazy)
-- =============================================================================

-- stylua: ignore start
later(function() require("config.autocomands") end) -- Autocomandos

-- Modulos mini
later(function() require("mini.animate").setup() end) -- Animaciones
later(function() require("mini.bracketed").setup() end) -- Movimientos "[" y "]"
later(function() require("mini.splitjoin").setup() end) -- Split/Join
later(function() require("mini.cursorword").setup() end)
later(function() require("mini.move").setup() end)
later(function() require("mini.indentscope").setup() end)
later(function() require("mini.pairs").setup() end)

-- Otros plugins simples
later(function() add("hiphish/rainbow-delimiters.nvim") end) -- Delimitadores arcoiris
later(function() add("mechatroner/rainbow_csv") end)  -- CSV Hightlights
later(function() add("b0o/SchemaStore.nvim") end)
later(function() add("R-nvim/R.nvim") end) -- R language

-- Agregando configuración plugins
later(function() require("plugins.mini-bufremove") end)
later(function() require("plugins.mini-comment") end)
later(function() require("plugins.mini-files") end)
later(function() require("plugins.mini-clue") end)
later(function() require("plugins.mini-surround") end)
later(function() require("plugins.mini-pick") end)
later(function() require("mini.extra").setup() end)
-- stylua: ignore end

-- Better Around/Inside textobjects
later(function()
  require("mini.ai").setup({ n_lines = 500 })
end)

-- [[ Treesitter ]]
later(function()
  add({
    source = "nvim-treesitter/nvim-treesitter",
    hooks = {
      post_checkout = function()
        vim.cmd("TSUpdate")
      end,
    },
  })
  -- TODO: Usar depends
  add("nvim-treesitter/nvim-treesitter-context")
  add("windwp/nvim-ts-autotag")
  add("JoosepAlviste/nvim-ts-context-commentstring")
  -- Carga configuración treesitter
  require("plugins.nvim-treesitter")
end)

-- [[ LSP Plugins ]]
later(function()
  -- CMP
  add("hrsh7th/nvim-cmp")
  add("hrsh7th/cmp-path")
  add("hrsh7th/cmp-buffer")
  add("R-nvim/cmp-r")
  add("hrsh7th/cmp-cmdline")
  add("onsails/lspkind-nvim")
  add("saadparwaiz1/cmp_luasnip")
  add("hrsh7th/cmp-nvim-lsp")

  -- Neodev
  add("folke/neodev.nvim")

  local function make_jsregexp(path)
    vim.notify("Compiling JSRegExp")
    vim.notify("path")
    vim.cmd("lcd " .. path)
    vim.cmd("!make -s install_jsregexp")
    vim.cmd("lcd -")
  end

  add({
    source = "L3MON4D3/LuaSnip",
    depends = {
      "rafamadriz/friendly-snippets",
    },
    hooks = {
      post_install = function(params)
        make_jsregexp(params.path)
      end,
      post_checkout = function(params)
        make_jsregexp(params.path)
      end,
    },
  })

  add({
    source = "neovim/nvim-lspconfig",
    depends = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
  })
  require("plugins.lsp")
end)

-- [[ Formateer ]]
later(function()
  add("stevearc/conform.nvim")
  require("plugins.conform")
end)

-- [[ flash.nvim ]]
later(function()
  add("folke/flash.nvim")
  require("plugins.flash")
end)

-- [[ GIT ]]
later(function()
  add("lewis6991/gitsigns.nvim")
  require("plugins.gitsigns")
end)

-- [[ Hightlights colors ]]
later(function()
  add("brenoprata10/nvim-highlight-colors")
  require("nvim-highlight-colors").setup({ enable_tailwind = true })
end)

-- [[ Copilot ]]
later(function()
  add("zbirenbaum/copilot.lua")
  add("zbirenbaum/copilot-cmp")
  add({
    source = "CopilotC-Nvim/CopilotChat.nvim",
    checkout = "canary",
    hooks = {
      post_checkout = function()
        vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
      end,
    },
  })
  require("plugins.copilot")
end)

-- Octo
later(function()
  add({
    source = "pwntester/octo.nvim",
    depends = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  })
  require("octo").setup({
    suppress_missing_scope = {
      projects_v2 = true,
    },
  })
end)

-- [[ Telescope ]]
later(function()
  add("nvim-telescope/telescope.nvim")
  add("nvim-telescope/telescope-fzf-native.nvim")
  add("nvim-telescope/telescope-ui-select.nvim")
  require("plugins.telescope")
end)

-- [[ TODO Comments ]]
later(function()
  add("folke/todo-comments.nvim")
  require("todo-comments").setup({
    signs = false,
  })
end)

-- [[ toggleterm ]]
later(function()
  add("akinsho/toggleterm.nvim")
  require("plugins.toggleterm")
end)

-- [[ Trouble ]]
later(function()
  add("folke/trouble.nvim")
  require("plugins.trouble")
end)

later(function()
  add("lukas-reineke/virt-column.nvim")
  require("virt-column").setup({
    char = "╎",
    virtcolumn = "80",
  })
end)

-- Harpoon
later(function()
  add({
    source = "ThePrimeagen/harpoon",
    checkout = "harpoon2",
    depends = { "nvim-lua/plenary.nvim" },
  })
  require("plugins.harpoon")
end)

-- Headlines (agrega backgroun color a chunks de Rmd)
later(function()
  add("lukas-reineke/headlines.nvim")
  require("plugins.headlines")
end)

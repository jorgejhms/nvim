--[[

  =============================================================================

     ██╗ ██████╗ ██████╗  ██████╗ ███████╗     ██╗██╗  ██╗███╗   ███╗███████╗
     ██║██╔═══██╗██╔══██╗██╔════╝ ██╔════╝     ██║██║  ██║████╗ ████║██╔════╝
     ██║██║   ██║██████╔╝██║  ███╗█████╗       ██║███████║██╔████╔██║███████╗
██   ██║██║   ██║██╔══██╗██║   ██║██╔══╝  ██   ██║██╔══██║██║╚██╔╝██║╚════██║
╚█████╔╝╚██████╔╝██║  ██║╚██████╔╝███████╗╚█████╔╝██║  ██║██║ ╚═╝ ██║███████║
 ╚════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝ ╚════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝

  Configuración personal Neovim
  jorgejhms@gmail.com
  =============================================================================

--]]

-- Carga e inicialización de MiniDeps
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

-- Agrega 'helpers'
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- =============================================================================
-- Carga inicial
-- revisar h: MiniDeps.now()
-- =============================================================================

now(function() require("config.options") end) -- Opciones generales
now(function() require("config.maps") end) -- Keymaps
now(function() require("plugins.ui") end)

now(function() add("nvim-lua/plenary.nvim") end)

-- =============================================================================
-- Carga posterior (Lazy)
-- Revisar h: MiniDeps.later()
-- =============================================================================

later(function() require("config.autocomands") end) -- Autocomandos

-- Modulos mini
later(function() require("mini.bracketed").setup() end) -- Movimientos "[" y "]"
later(function() require("mini.splitjoin").setup() end) -- Split/Join
later(function() require("mini.colors").setup() end)
later(function() require("mini.cursorword").setup() end)
later(function() require("mini.move").setup() end)
later(function() require("mini.indentscope").setup() end)
later(function() require("mini.pairs").setup() end)
later(function() require("mini.git").setup() end)
later(function() require("mini.extra").setup() end)
later(function() require("mini.icons").setup() end)
MiniIcons.mock_nvim_web_devicons()

-- Otros plugins simples
later(function() add("hiphish/rainbow-delimiters.nvim") end) -- Delimitadores arcoiris
later(function() add("mechatroner/rainbow_csv") end) -- CSV Hightlights
later(function() add("b0o/SchemaStore.nvim") end)

-- Agregando configuración plugins
later(function() require("plugins.mini-bufremove") end)
later(function() require("plugins.mini-comment") end)
later(function() require("plugins.mini-files") end)
later(function() require("plugins.mini-clue") end)
later(function() require("plugins.mini-surround") end)
later(function() require("plugins.mini-pick") end)
later(function() require("plugins.mini-animate") end) -- Animaciones
later(function() require("plugins.mini-basics") end)
later(function() require("plugins.mini-diff") end)

-- Better Around/Inside textobjects
later(function() require("mini.ai").setup({ n_lines = 500 }) end)

-- [[ Treesitter ]]
later(function()
  add({
    source = "nvim-treesitter/nvim-treesitter",
    hooks = {
      post_checkout = function() vim.cmd("TSUpdate") end,
    },
  })
  add("nvim-treesitter/nvim-treesitter-context")
  add("windwp/nvim-ts-autotag")
  add("JoosepAlviste/nvim-ts-context-commentstring")
  -- Carga configuración treesitter
  require("plugins.nvim-treesitter")
end)

-- [[ LSP Plugins ]]
later(function()
  add({
    source = "hrsh7th/nvim-cmp",
    depends = {
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "R-nvim/cmp-r",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "onsails/lspkind-nvim",
    },
  })

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
      post_install = function(params) make_jsregexp(params.path) end,
      post_checkout = function(params) make_jsregexp(params.path) end,
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

-- [[ Hightlights colors ]]
later(function()
  add("brenoprata10/nvim-highlight-colors")
  require("nvim-highlight-colors").setup({ enable_tailwind = true })
end)

-- Dressing
later(function()
  add("stevearc/dressing.nvim")
  require("dressing").setup()
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

-- NOTE: No se está usando
-- Octo
later(function()
  add({
    source = "pwntester/octo.nvim",
    depends = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  })
  require("plugins.octo")
end)

-- [[ Telescope ]]
later(function() require("plugins.telescope") end)

-- [[ TODO Comments ]]
later(function()
  add("folke/todo-comments.nvim")
  require("todo-comments").setup()
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

later(function() require("plugins.virt-column") end)

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

-- Nvim-Tmux-Navigator
later(function() require("plugins.nvim-tmux-navigator") end)

-- R nvim
later(function() require("plugins.R-nvim") end) -- R language

-- Python venv selector
later(function() require("plugins.python-venv-selector") end)

-- Suporte básico para MDX
later(function()
  add({
    source = "davidmh/mdx.nvim",
    depends = { "nvim-treesitter/nvim-treesitter" },
  })
  require("mdx").setup()
end)

-- later(function() require("plugins.noice") end)

-- TODO: Pasar configuración a archivo separado
-- Config neovide
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.o.guifont = "Input Mono Condensed:h14" -- text below applies for VimScript
  vim.g.neovide_input_macos_alt_is_meta = true
end

-- Tema por defecto
vim.cmd.colorscheme("dracula")
-- TODO: Crear configuración Vscode

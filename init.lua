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

require("mini.deps").setup({ path = { package = path_package } })
-- Agrega 'helpers'
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Configuración básica
now(function()
  require("mini.basics").setup({
    options = {
      basic = true,
      extra_ui = true,
      win_borders = "single",
    },
    mappings = {
      basic = true,
      option_toggle_prefix = [[<Leader>u]],
      windows = true,
      move_with_alt = true,
    },
    -- Autocommands. Set to `false` to disable
    autocommands = {
      basic = true,
      relnum_in_visual_mode = false,
    },
    silent = false,
  })

  vim.opt.cmdheight = 0 -- Oculta línea de comandos
  vim.opt.clipboard = "unnamedplus" -- Sincroniza el portapapales del sistema
  vim.opt.tabstop = 2 -- 2 espacios como tab
  vim.opt.shiftwidth = 2 -- 2 espacios ancho de tab
  vim.opt.expandtab = true -- Usa espacios en lugar de tabs
  vim.opt.wrap = true -- Wrap por defecto
  vim.opt.swapfile = false -- No usa swapfiles
end)

now(function() require("config.keymaps") end)
now(function() require("config.autocommands") end)

-- UI
now(function()
  require("mini.notify").setup()
  vim.notify = MiniNotify.make_notify()
  require("mini.starter").setup()
  require("mini.statusline").setup()

  require("mini.sessions").setup({
    autowrite = true,
  })

  require("mini.tabline").setup({
    tabpage_section = "right",
  })
end)

later(function() require("mini.ai").setup({ n_lines = 500 }) end)
later(function() require("mini.bracketed").setup() end) -- Movimientos "[" y "]"
later(function() require("mini.splitjoin").setup() end) -- Split/Join
later(function() require("mini.colors").setup() end)
later(function() require("mini.cursorword").setup() end)
later(function() require("mini.jump").setup() end)
later(function() require("mini.jump2d").setup() end)
later(function() require("mini.move").setup() end)
later(function() require("mini.pairs").setup() end)
later(function() require("mini.git").setup() end)
later(function() require("mini.extra").setup() end)
later(function() require("plugins.mini") end)

-- Treesitter
later(function()
  add({
    source = "nvim-treesitter/nvim-treesitter",
    depends = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    hooks = {
      post_checkout = function() vim.cmd("TSUpdate") end,
    },
  })

  require("plugins.treesitter")
  require("ts_context_commentstring").setup({
    enable_autocmd = false,
  })
end)

-- LSP
later(function()
  add("neovim/nvim-lspconfig")

  add({
    source = "hrsh7th/nvim-cmp",
    depends = {
      "hrsh7th/cmp-nvim-lsp", -- LSP source
      "hrsh7th/cmp-buffer", -- Buffer source
      "hrsh7th/cmp-path", -- File path source
      "hrsh7th/cmp-cmdline", -- Command line source
      "R-nvim/cmp-r", -- Soporte R
      "tranzystorekk/cmp-minikind.nvim", -- Usa mini.icons
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  })
  add({
    source = "Exafunction/codeium.nvim",
    depends = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
  })

  require("plugins.lsp")
  require("plugins.cmp")
end)

-- Mason
later(function()
  add({
    source = "williamboman/mason.nvim",
    -- depends = {
    -- 	"williamboman/mason-lspconfig.nvim",
    -- 	"WhoIsSethDaniel/mason-tool-installer.nvim",
    -- }
  })
  require("mason").setup()
  -- require("mason-lspconfig").setup()
  -- require("mason-tool-installer").setup()
end)

-- Hightlights colors
later(function()
  add("brenoprata10/nvim-highlight-colors")
  require("nvim-highlight-colors").setup({
    enable_tailwind = true,
  })
end)

later(function() add("hiphish/rainbow-delimiters.nvim") end) -- Delimitadores arcoiris
later(function() add("mechatroner/rainbow_csv") end) -- CSV Hightlights

-- [[ Formateer ]]
later(function()
  add("stevearc/conform.nvim")
  require("plugins.conform")
end)

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

later(function()
  add("lukas-reineke/virt-column.nvim")
  require("plugins.virt-column")
end)

-- Nvim-Tmux-Navigator
later(function()
  add("alexghergh/nvim-tmux-navigation")
  require("plugins.nvim-tmux-navigator")
end)

-- R nvim
later(function()
  add("R-nvim/R.nvim")
  require("plugins.R-nvim")
end)

-- Python venv selector
later(function()
  add({
    source = "linux-cultist/venv-selector.nvim",
    checkout = "regexp",
    depends = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
  })

  require("plugins.python-venv-selector")
end)

-- Suporte básico para MDX
later(function()
  add({
    source = "davidmh/mdx.nvim",
    depends = { "nvim-treesitter/nvim-treesitter" },
  })
  require("mdx").setup()
end)

-- Colores
later(function()
  add("EdenEast/nightfox.nvim")
  add("binhtran432k/dracula.nvim")
  add("bluz71/vim-moonfly-colors")
  add("catppuccin/nvim")
  add("eldritch-theme/eldritch.nvim")
  add("folke/tokyonight.nvim")
  add("jim-at-jibba/ariake.nvim")
  add("navarasu/onedark.nvim")
  add("projekt0n/github-nvim-theme")
  add("rebelot/kanagawa.nvim")
  add("sainnhe/edge")
  add("sainnhe/gruvbox-material")
  add("sainnhe/sonokai")
  add("scottmckendry/cyberdream.nvim")
  add("shaunsingh/nord.nvim")
  add("tanvirtin/monokai.nvim")
  add({ source = "rose-pine/neovim", name = "rose-pine" })
  require("plugins.colors")
  vim.cmd("colorscheme randomhue")
end)

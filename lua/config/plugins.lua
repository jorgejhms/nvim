-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
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

-- Set up 'mini.deps' (customize to your liking)
require("mini.deps").setup({ path = { package = path_package } })

local add = MiniDeps.add

-- Notifications
require("mini.notify").setup()
vim.notify = MiniNotify.make_notify()
--==============================================================================
-- Plugins instalation
--==============================================================================

-- [[ Color schemes ]]
add("folke/tokyonight.nvim")
add("catppuccin/nvim")
add("binhtran432k/dracula.nvim")
add("sainnhe/edge")
add("navarasu/onedark.nvim")
add("EdenEast/nightfox.nvim")
add("morhetz/gruvbox")
add("Shatur/neovim-ayu")
add("oxfist/night-owl.nvim")
add("rafamadriz/neon")
add("sainnhe/sonokai")
add("tanvirtin/monokai.nvim")
add("projekt0n/github-nvim-theme")
add("nyngwang/nvimgelion")
add("mhartington/oceanic-next")
add("rebelot/kanagawa.nvim")
add("shaunsingh/nord.nvim")
add("NTBBloodbath/doom-one.nvim")
add("sontungexpt/witch")
add("bluz71/vim-moonfly-colors")

-- Basic plugins
add("nvim-lua/plenary.nvim")
add("nvim-tree/nvim-web-devicons")

-- [[ LSP Plugins ]]
add({
  source = "neovim/nvim-lspconfig",
  depends = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
})
add("hrsh7th/cmp-nvim-lsp")

-- Neodev
add("folke/neodev.nvim")

-- [[ CMP ]]
add("hrsh7th/nvim-cmp")
add("hrsh7th/cmp-path")
add("hrsh7th/cmp-buffer")

add("hrsh7th/cmp-cmdline")
add("onsails/lspkind-nvim")
add("saadparwaiz1/cmp_luasnip")
add({
  source = "L3MON4D3/LuaSnip",
  hooks = {
    build = (function()
      -- Build Step is needed for regex support in snippets
      -- This step is not supported in many windows environments
      -- Remove the below condition to re-enable on windows
      if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
        return
      end
      return "make install_jsregexp"
    end)(),
  },
})
add("rafamadriz/friendly-snippets")

-- [[ Formateer ]]
add("stevearc/conform.nvim")

-- [[ Copilot ]]
add("zbirenbaum/copilot.lua")
add("zbirenbaum/copilot-cmp")
add({
  source = "CopilotC-Nvim/CopilotChat.nvim",
  checkout = "canary",
  hooks = {
    build = {
      function()
        vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
      end,
    },
  },
})

-- flash.nvim
add("folke/flash.nvim")

-- [[ GIT ]]
add("lewis6991/gitsigns.nvim")

-- [[ Hightlights colors ]]
add("brenoprata10/nvim-highlight-colors")
require("nvim-highlight-colors").setup({ enable_tailwind = true })

add("nvim-pack/nvim-spectre")
vim.keymap.set("n", "<leader>fr", function()
  require("spectre").open()
end, { desc = "Replace in files (Spectre)" })

-- [[ Treesitter ]]
add({
  source = "nvim-treesitter/nvim-treesitter",
  hooks = {
    build = {
      ":TSUpdate",
    },
  },
})
add("nvim-treesitter/nvim-treesitter-context")
add("windwp/nvim-ts-autotag")
add("JoosepAlviste/nvim-ts-context-commentstring")

-- Octo
add("pwntester/octo.nvim")
require("octo").setup()

add("hiphish/rainbow-delimiters.nvim")
add("mechatroner/rainbow_csv") -- CSV Hightlights
add("b0o/SchemaStore.nvim")

-- [[ Telescope ]]
add("nvim-telescope/telescope.nvim")
add("nvim-telescope/telescope-fzf-native.nvim")
add("nvim-telescope/telescope-ui-select.nvim")

add("folke/todo-comments.nvim")
require("todo-comments").setup({
  signs = false,
})
add("akinsho/toggleterm.nvim")

add("folke/trouble.nvim")

add("lukas-reineke/virt-column.nvim")
require("virt-column").setup({
  char = "╎",
  virtcolumn = "80",
})

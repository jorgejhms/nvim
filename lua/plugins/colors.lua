local add = MiniDeps.add

add("jim-at-jibba/ariake.nvim")
add("folke/tokyonight.nvim")
add("catppuccin/nvim")
add("eldritch-theme/eldritch.nvim")
add("binhtran432k/dracula.nvim")
add("sainnhe/edge")
add("navarasu/onedark.nvim")
add("EdenEast/nightfox.nvim")
add("sainnhe/gruvbox-material")
-- add("Shatur/neovim-ayu")
-- add("oxfist/night-owl.nvim")
-- add("rafamadriz/neon")
add("sainnhe/sonokai")
add("tanvirtin/monokai.nvim")
add("projekt0n/github-nvim-theme")
-- add("nyngwang/nvimgelion")
-- add("mhartington/oceanic-next")
add("rebelot/kanagawa.nvim")
add("shaunsingh/nord.nvim")
-- add("NTBBloodbath/doom-one.nvim")
-- add("sontungexpt/witch")
add("bluz71/vim-moonfly-colors")
-- add("rose-pine/neovim")
add("scottmckendry/cyberdream.nvim")

-- Opciones adicionales dracula
require("dracula").setup({
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    sidebars = "dark",
  },
  floats = "transparent",
})

-- cyberdream
require("cyberdream").setup({
  -- Recommended - see "Configuring" below for more config options
  transparent = true,
  italic_comments = true,
  hide_fillchars = true,
  borderless_telescope = true,
  terminal_colors = true,
})

-- catppuccin
require("catppuccin").setup({
  integrations = {
    mini = {
      enabled = true,
      indentscope_color = "",
    },
  },
})

-- Tema por defecto
vim.cmd.colorscheme("dracula")

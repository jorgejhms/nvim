local add = MiniDeps.add

add("jim-at-jibba/ariake.nvim")
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

-- Opciones adicionales dracula
require("dracula").setup({
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    sidebars = "dark",
  },
  floats = "transparent",
})

-- Tema por defecto
vim.cmd.colorscheme("dracula")

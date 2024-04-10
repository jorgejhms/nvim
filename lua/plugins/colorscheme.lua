-- Temas de colores
return {
  -- Remplazar andromeda
  -- { "WhiteBlackGoose/andromeda.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "binhtran432k/dracula.nvim",
    lazy = false,
    priority = 1000,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      sidebars = "dark",
    },
    floats = "transparent",
  },
  { "sainnhe/edge" },
  { "navarasu/onedark.nvim", opts = { style = "darker" } },
  { "EdenEast/nightfox.nvim" },
  { "morhetz/gruvbox" },
  { "/Shatur/neovim-ayu" },
  { "oxfist/night-owl.nvim" },
  { "rafamadriz/neon" },
  { "sainnhe/sonokai" },
  { "tanvirtin/monokai.nvim" },
  { "projekt0n/github-nvim-theme" },
  { "nyngwang/nvimgelion" },
  { "mhartington/oceanic-next" },
  { "rebelot/kanagawa.nvim" },
  { "shaunsingh/nord.nvim" },
  { "NTBBloodbath/doom-one.nvim" },
  { "sontungexpt/witch" },
  { "bluz71/vim-moonfly-colors" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
}

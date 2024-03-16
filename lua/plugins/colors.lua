return {
  -- Temas de colores
  { "navarasu/onedark.nvim", opts = { style = "darker" } },
  { "EdenEast/nightfox.nvim" },
  { "WhiteBlackGoose/andromeda.nvim" },
  { "morhetz/gruvbox" },
  { "/Shatur/neovim-ayu" },
  { "NLKNguyen/papercolor-theme" },
  { "sainnhe/edge" },
  {
    "binhtran432k/dracula.nvim",
    lazy = false,
    priority = 1000,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      sidebars = "dark",
      floats = "transparent",
    },
  },
  { "oxfist/night-owl.nvim" },
  { "rafamadriz/neon" },
  { "sainnhe/sonokai" },
  { "nvimdev/zephyr-nvim" },
  { "tanvirtin/monokai.nvim" },
  { "projekt0n/github-nvim-theme" },
  { "nyngwang/nvimgelion" },
  { "mhartington/oceanic-next" },
  { "rebelot/kanagawa.nvim" },
  { "shaunsingh/nord.nvim" },
  { "NTBBloodbath/doom-one.nvim" },
  { "sontungexpt/witch" },
  {
    "glepnir/zephyr-nvim",
    requires = { "nvim-treesitter/nvim-treesitter", opt = true },
  },
  { "bluz71/vim-moonfly-colors" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}

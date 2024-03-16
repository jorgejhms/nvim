-- Temas de colores
return {
  { "WhiteBlackGoose/andromeda.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
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
    { "sainnhe/edge" },
    { "navarasu/onedark.nvim",     opts = { style = "darker" } },
    { "EdenEast/nightfox.nvim" },
    { "morhetz/gruvbox" },
    { "/Shatur/neovim-ayu" },
    { "NLKNguyen/papercolor-theme" },
    floats = "transparent",
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
  -- Default
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    init = function()
      vim.cmd.colorscheme("tokyonight")
    end
  }
}

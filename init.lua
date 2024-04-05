-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd("source $HOME/.config/nvim/config/nvim-r.vim")

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.o.guifont = "JetBrainsMono Nerd Font Mono:h13" -- text below applies for VimScript
end

-- Solarized color scheme
-- https://ethanschoonover.com/solarized/
-- author: Ethan Schoonover
local use_cterm, palette

if vim.o.background == "dark" then
  palette = {
    base00 = "#002b36",
    base01 = "#073642",
    base02 = "#33515b",
    base03 = "#586e75",
    base04 = "#657b83",
    base05 = "#839496",
    base06 = "#93a1a1",
    base07 = "#fdf6e3",
    base08 = "#dc322f",
    base09 = "#cb4b16",
    base0A = "#b58900",
    base0B = "#859900",
    base0C = "#2aa198",
    base0D = "#268bd2",
    base0E = "#6c71c4",
    base0F = "#d33682",
  }
  use_cterm = true
end

if vim.o.background == "light" then
  palette = {
    base00 = "#fdf6e3",
    base01 = "#eee8d5",
    base02 = "#c0c4bb",
    base03 = "#93a1a1",
    base04 = "#839496",
    base05 = "#657b83",
    base06 = "#586e75",
    base07 = "#002b36",
    base08 = "#dc322f",
    base09 = "#cb4b16",
    base0A = "#b58900",
    base0B = "#859900",
    base0C = "#2aa198",
    base0D = "#268bd2",
    base0E = "#6c71c4",
    base0F = "#d33682",
  }
  use_cterm = true
end

if palette then
  require("mini.base16").setup({ palette = palette, use_cterm = use_cterm })
  vim.g.colors_name = "modus-tinted"
end

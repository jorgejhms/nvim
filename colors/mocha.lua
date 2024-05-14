-- Base 16 Mocha
-- https://github.com/chriskempson/base16-default-schemes
-- author: "Chris Kempson (http://chriskempson.com)"
local use_cterm, palette

-- Dark palette is an output of 'MiniBase16.mini_palette':
-- - Background '#0A2A2A' (LCh(uv) = 15-10-192)
-- - Foreground '#D0D0D0' (Lch(uv) = 83-0-0)
-- - Accent chroma 50
palette = {
  base00 = "#3B3228",
  base01 = "#534636",
  base02 = "#645240",
  base03 = "#7e705a",
  base04 = "#b8afad",
  base05 = "#d0c8c6",
  base06 = "#e9e1dd",
  base07 = "#f5eeeb",
  base08 = "#cb6077",
  base09 = "#d28b71",
  base0A = "#f4bc87",
  base0B = "#beb55b",
  base0C = "#7bbda4",
  base0D = "#8ab3b5",
  base0E = "#a89bb9",
  base0F = "#bb9584",
}
use_cterm = true

if palette then
  require("mini.base16").setup({ palette = palette, use_cterm = use_cterm })
  vim.g.colors_name = "mocha"
end

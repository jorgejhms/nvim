-- Base 16 Cupcake
-- https://github.com/chriskempson/base16-default-schemes
-- author: "Chris Kempson (http://chriskempson.com)"
local use_cterm, palette

-- Dark palette is an output of 'MiniBase16.mini_palette':
-- - Background '#0A2A2A' (LCh(uv) = 15-10-192)
-- - Foreground '#D0D0D0' (Lch(uv) = 83-0-0)
-- - Accent chroma 50
palette = {
  base00 = "#fbf1f2",
  base01 = "#f2f1f4",
  base02 = "#d8d5dd",
  base03 = "#bfb9c6",
  base04 = "#a59daf",
  base05 = "#8b8198",
  base06 = "#72677E",
  base07 = "#585062",
  base08 = "#D57E85",
  base09 = "#EBB790",
  base0A = "#DCB16C",
  base0B = "#A3B367",
  base0C = "#69A9A7",
  base0D = "#7297B9",
  base0E = "#BB99B4",
  base0F = "#BAA58C",
}
use_cterm = true

if palette then
  require("mini.base16").setup({ palette = palette, use_cterm = use_cterm })
  vim.g.colors_name = "cupcake"
end

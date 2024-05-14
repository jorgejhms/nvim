-- Base 16 Eighties
-- https://github.com/chriskempson/base16-default-schemes
-- author: "Chris Kempson (http://chriskempson.com)"
local use_cterm, palette

-- Dark palette is an output of 'MiniBase16.mini_palette':
-- - Background '#0A2A2A' (LCh(uv) = 15-10-192)
-- - Foreground '#D0D0D0' (Lch(uv) = 83-0-0)
-- - Accent chroma 50
palette = {
  base00 = "#2d2d2d",
  base01 = "#393939",
  base02 = "#515151",
  base03 = "#747369",
  base04 = "#a09f93",
  base05 = "#d3d0c8",
  base06 = "#e8e6df",
  base07 = "#f2f0ec",
  base08 = "#f2777a",
  base09 = "#f99157",
  base0A = "#ffcc66",
  base0B = "#99cc99",
  base0C = "#66cccc",
  base0D = "#6699cc",
  base0E = "#cc99cc",
  base0F = "#d27b53",
}
use_cterm = true

if palette then
  require("mini.base16").setup({ palette = palette, use_cterm = use_cterm })
  vim.g.colors_name = "eighties"
end

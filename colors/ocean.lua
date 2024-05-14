-- Base 16 Ocean
-- https://github.com/chriskempson/base16-default-schemes
-- author: "Chris Kempson (http://chriskempson.com)"
local use_cterm, palette

-- Dark palette is an output of 'MiniBase16.mini_palette':
-- - Background '#0A2A2A' (LCh(uv) = 15-10-192)
-- - Foreground '#D0D0D0' (Lch(uv) = 83-0-0)
-- - Accent chroma 50
palette = {
  base00 = "#2b303b",
  base01 = "#343d46",
  base02 = "#4f5b66",
  base03 = "#65737e",
  base04 = "#a7adba",
  base05 = "#c0c5ce",
  base06 = "#dfe1e8",
  base07 = "#eff1f5",
  base08 = "#bf616a",
  base09 = "#d08770",
  base0A = "#ebcb8b",
  base0B = "#a3be8c",
  base0C = "#96b5b4",
  base0D = "#8fa1b3",
  base0E = "#b48ead",
  base0F = "#ab7967",
}
use_cterm = true

if palette then
  require("mini.base16").setup({ palette = palette, use_cterm = use_cterm })
  vim.g.colors_name = "ocean"
end

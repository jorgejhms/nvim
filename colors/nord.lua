-- Base 16 Nord
-- https://github.com/ada-lovecraft/base16-nord-scheme
-- author: "arcticicestudio"
local use_cterm, palette

-- Dark palette is an output of 'MiniBase16.mini_palette':
-- - Background '#0A2A2A' (LCh(uv) = 15-10-192)
-- - Foreground '#D0D0D0' (Lch(uv) = 83-0-0)
-- - Accent chroma 50
palette = {
  base00 = "#2E3440",
  base01 = "#3B4252",
  base02 = "#434C5E",
  base03 = "#4C566A",
  base04 = "#D8DEE9",
  base05 = "#E5E9F0",
  base06 = "#ECEFF4",
  base07 = "#8FBCBB",
  base08 = "#88C0D0",
  base09 = "#81A1C1",
  base0A = "#5E81AC",
  base0B = "#BF616A",
  base0C = "#D08770",
  base0D = "#EBCB8B",
  base0E = "#A3BE8C",
  base0F = "#B48EAD",
}
use_cterm = true

if palette then
  require("mini.base16").setup({ palette = palette, use_cterm = use_cterm })
  vim.g.colors_name = "nord"
end

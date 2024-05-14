-- Base 16 Dracula
-- https://github.com/dracula/base16-dracula-scheme
-- author: "Mike Barkmin (http://github.com/mikebarkmin) based on Dracula Theme (http://github.com/dracula)"
local use_cterm, palette

-- Dark palette is an output of 'MiniBase16.mini_palette':
-- - Background '#0A2A2A' (LCh(uv) = 15-10-192)
-- - Foreground '#D0D0D0' (Lch(uv) = 83-0-0)
-- - Accent chroma 50
palette = {
  base00 = "#282936",
  base01 = "#3a3c4e",
  base02 = "#4d4f68",
  base03 = "#626483",
  base04 = "#62d6e8",
  base05 = "#e9e9f4",
  base06 = "#f1f2f8",
  base07 = "#f7f7fb",
  base08 = "#ea51b2",
  base09 = "#b45bcf",
  base0A = "#00f769",
  base0B = "#ebff87",
  base0C = "#a1efe4",
  base0D = "#62d6e8",
  base0E = "#b45bcf",
  base0F = "#00f769",
}
use_cterm = true

if palette then
  require("mini.base16").setup({ palette = palette, use_cterm = use_cterm })
  vim.g.colors_name = "eighties"
end

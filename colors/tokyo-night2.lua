-- Tokyo Night
-- https://github.com/tinted-theming/schemes/blob/spec-0.11/base16
-- author: "Michaël Ball"
local use_cterm, palette

-- Dark palette is an output of 'MiniBase16.mini_palette':
-- - Background '#0A2A2A' (LCh(uv) = 15-10-192)
-- - Foreground '#D0D0D0' (Lch(uv) = 83-0-0)
-- - Accent chroma 50
if vim.o.background == "dark" then
  palette = {
    base00 = "#1A1B26",
    base01 = "#16161E",
    base02 = "#2F3549",
    base03 = "#444B6A",
    base04 = "#787C99",
    base05 = "#A9B1D6",
    base06 = "#CBCCD1",
    base07 = "#D5D6DB",
    base08 = "#C0CAF5",
    base09 = "#A9B1D6",
    base0A = "#0DB9D7",
    base0B = "#9ECE6A",
    base0C = "#B4F9F8",
    base0D = "#2AC3DE",
    base0E = "#BB9AF7",
    base0F = "#F7768E",
  }
  use_cterm = true
end

-- Light palette is an 'inverted dark', output of 'MiniBase16.mini_palette':
-- - Background '#C0D2D2' (LCh(uv) = 83-10-192)
-- - Foreground '#262626' (Lch(uv) = 15-0-0)
-- - Accent chroma 80
if vim.o.background == "light" then
  palette = {
    base00 = "#D5D6DB",
    base01 = "#CBCCD1",
    base02 = "#DFE0E5",
    base03 = "#9699A3",
    base04 = "#4C505E",
    base05 = "#343B59",
    base06 = "#1A1B26",
    base07 = "#1A1B26",
    base08 = "#343B58",
    base09 = "#965027",
    base0A = "#166775",
    base0B = "#485E30",
    base0C = "#3E6968",
    base0D = "#34548A",
    base0E = "#5A4A78",
    base0F = "#8C4351",
  }
  use_cterm = true
end

if palette then
  require("mini.base16").setup({ palette = palette, use_cterm = use_cterm })
  vim.g.colors_name = "tokyo-night"
end

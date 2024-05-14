-- Base 16 Gruvbox Hard
-- https://github.com/dawikur/base16-gruvbox-scheme
-- author: author: "Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)"
local use_cterm, palette

-- Dark palette is an output of 'MiniBase16.mini_palette':
-- - Background '#0A2A2A' (LCh(uv) = 15-10-192)
-- - Foreground '#D0D0D0' (Lch(uv) = 83-0-0)
-- - Accent chroma 50
if vim.o.background == "dark" then
  palette = {
    base00 = "#1d2021",
    base01 = "#3c3836",
    base02 = "#504945",
    base03 = "#665c54",
    base04 = "#bdae93",
    base05 = "#d5c4a1",
    base06 = "#ebdbb2",
    base07 = "#fbf1c7",
    base08 = "#fb4934",
    base09 = "#fe8019",
    base0A = "#fabd2f",
    base0B = "#b8bb26",
    base0C = "#8ec07c",
    base0D = "#83a598",
    base0E = "#d3869b",
    base0F = "#d65d0e",
  }
  use_cterm = true
end

-- Light palette is an 'inverted dark', output of 'MiniBase16.mini_palette':
-- - Background '#C0D2D2' (LCh(uv) = 83-10-192)
-- - Foreground '#262626' (Lch(uv) = 15-0-0)
-- - Accent chroma 80
if vim.o.background == "light" then
  palette = {
    base00 = "#f9f5d7",
    base01 = "#ebdbb2",
    base02 = "#d5c4a1",
    base03 = "#bdae93",
    base04 = "#665c54",
    base05 = "#504945",
    base06 = "#3c3836",
    base07 = "#282828",
    base08 = "#9d0006",
    base09 = "#af3a03",
    base0A = "#b57614",
    base0B = "#79740e",
    base0C = "#427b58",
    base0D = "#076678",
    base0E = "#8f3f71",
    base0F = "#d65d0e",
  }
  use_cterm = true
end

if palette then
  require("mini.base16").setup({ palette = palette, use_cterm = use_cterm })
  vim.g.colors_name = "gruvbox-hard"
end

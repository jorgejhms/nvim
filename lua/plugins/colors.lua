local add = MiniDeps.add

-- Opciones adicionales dracula
require("dracula").setup({
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    sidebars = "dark",
  },
  floats = "transparent",
})

-- cyberdream
require("cyberdream").setup({
  -- Recommended - see "Configuring" below for more config options
  transparent = true,
  italic_comments = true,
  hide_fillchars = true,
  borderless_telescope = true,
  terminal_colors = true,
})

-- catppuccin
require("catppuccin").setup({
  transparent_background = false, -- disables setting the background color.
  integrations = {
    mini = {
      enabled = true,
      indentscope_color = "",
    },
  },
})

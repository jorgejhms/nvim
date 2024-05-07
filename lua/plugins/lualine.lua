require("lualine").setup({

  options = {
    icons_enabled = true,
    theme = "auto",
    -- component_separators = { left = '', right = '' },
    -- component_separators = { left = '>', right = '<' },
    -- section_separators = { left = "", right = "" },
    -- section_separators = { left = "", right = "" },
    -- component_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = {
      "diff",
      {
        "diagnostics",
        -- Simbolos
        symbols = {
          error = " ",
          warn = " ",
          hint = " ",
          info = " ",
        },
      },
    },
    lualine_x = {
      "encoding",
      "fileformat",
      "filesize",
      "searchcount",
      "selectioncount",
    },
    lualine_y = { "filetype" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filesize" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
    lualine_a = { "buffers" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "tabs" },
  },
})

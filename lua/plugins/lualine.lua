--- Esta función verifica si el usuario está actualmente grabando una macro en Neovim.
-- @return string El estado de la grabación, ya sea una cadena vacía o una cadena con el icono de grabación y el nombre del registro.
local function isRecording()
  local reg = vim.fn.reg_recording()
  if reg == "" then return "" end -- not recording
  return " " .. reg
end

--- Esta función verifica si el texto en la ventana actual de Neovim está ajustado.
-- @return string El estado del ajuste de texto, ya sea una cadena vacía o una cadena con el icono de ajuste.
local function isWrapped()
  local wrap = vim.wo.wrap and "󰖶 " or ""
  return wrap
end

--- Esta función verifica si la corrección ortográfica está habilitada en la ventana actual de Neovim.
-- @return string El estado de la corrección ortográfica, ya sea una cadena vacía o una cadena con el icono de corrección ortográfica.
local function spellOn()
  local spell = vim.wo.spell and "󰓆 " or ""
  return spell
end

-- Verifica si Github Copilot está activo
-- @return string El estado de Github Copilot, ya sea una cadena vacía o una cadena con el mensaje de estado de Github Copilot.
local function isCopilotActive()
  local status_ok, copilot_api = pcall(require, "copilot.api")
  if not status_ok then return end

  local copilot = copilot_api.status.data
  return " " .. (copilot.message or "")
end

local function isLspHintsActive()
  local hints_enabled = vim.lsp.inlay_hint.is_enabled() and " " or ""
  return hints_enabled
end

require("lualine").setup({

  options = {
    icons_enabled = true,
    theme = "auto",
    -- options: "", "" "", "" "
    section_separators = { left = "", right = "" },
    -- options: "", "" "", '>' '<', "" ""
    component_separators = { left = "", right = "" },
    disabled_filetypes = { "starter" },
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
      isLspHintsActive,
      isRecording,
      isWrapped,
      spellOn,
      isCopilotActive,
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

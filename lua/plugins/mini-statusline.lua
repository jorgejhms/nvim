--- Esta función verifica si el usuario está actualmente grabando una macro en Neovim.
-- @return string El estado de la grabación, ya sea una cadena vacía o una cadena con el icono de grabación y el nombre del registro.
local function isRecording()
  local reg = vim.fn.reg_recording()
  if reg == "" then
    return ""
  end -- not recording
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
  if not status_ok then
    return
  end

  local copilot = copilot_api.status.data
  return " " .. (copilot.message or "")
end

local function isLspHintsActive()
  local hints_enabled = vim.lsp.inlay_hint.is_enabled() and " " or ""
  return hints_enabled
end

local statusline = require("mini.statusline")

local active = function()
  local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
  local git = MiniStatusline.section_git({ trunc_width = 75 })
  local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
  local filename = MiniStatusline.section_filename({ trunc_width = 140 })
  local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
  local location = MiniStatusline.section_location({ trunc_width = 75 })
  local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
  local recording = isRecording()
  local wrapped = isWrapped()
  local spell = spellOn()
  local copilot = isCopilotActive()
  local hints_enabled = isLspHintsActive()

  return MiniStatusline.combine_groups({
    { hl = mode_hl, strings = { mode } },
    { hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
    "%<", -- Mark general truncate point
    { hl = "MiniStatuslineFilename", strings = { filename } },
    "%=", -- End left alignment
    { strings = { hints_enabled, recording, wrapped, spell, copilot } },
    { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
    { hl = mode_hl, strings = { search, location } },
  })
end

statusline.setup({ content = { active = active }, use_icons = vim.g.have_nerd_font })

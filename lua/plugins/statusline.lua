-- Entorno Python activo según venv-selector; clic izquierdo abre el selector
function StatuslineVenvSelect() vim.cmd("VenvSelect") end

local function section_venv()
  if vim.bo.filetype ~= "python" then return "" end

  local venv = package.loaded["venv-selector"] and require("venv-selector").venv()
  local label = venv and (vim.fn.fnamemodify(venv, ":h:t") .. "/" .. vim.fn.fnamemodify(venv, ":t")) or "sin venv"
  return "%@v:lua.StatuslineVenvSelect@" .. label .. "%X"
end

-- Igual que el contenido por defecto de mini.statusline, más section_venv
local function content_active()
  local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
  local git = MiniStatusline.section_git({ trunc_width = 40 })
  local diff = MiniStatusline.section_diff({ trunc_width = 75 })
  local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
  local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
  local filename = MiniStatusline.section_filename({ trunc_width = 140 })
  local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
  local location = MiniStatusline.section_location({ trunc_width = 75 })
  local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

  return MiniStatusline.combine_groups({
    { hl = mode_hl, strings = { mode } },
    { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
    "%<",
    { hl = "MiniStatuslineFilename", strings = { filename } },
    "%=",
    { hl = "MiniStatuslineFileinfo", strings = { section_venv(), fileinfo } },
    { hl = mode_hl, strings = { search, location } },
  })
end

require("mini.statusline").setup({ content = { active = content_active } })

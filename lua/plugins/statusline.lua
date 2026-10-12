-- Entorno Python activo según venv-selector; clic izquierdo abre el selector
function StatuslineVenvSelect() vim.cmd("VenvSelect") end
function StatuslineDepsUpdate() vim.cmd("DepsUpdate") end

local function section_venv()
  if vim.bo.filetype ~= "python" then return "" end

  local venv = package.loaded["venv-selector"] and require("venv-selector").venv()
  local label = venv and (vim.fn.fnamemodify(venv, ":h:t") .. "/" .. vim.fn.fnamemodify(venv, ":t")) or "sin venv"
  return "%@v:lua.StatuslineVenvSelect@󱔎 " .. label .. "%X"
end

-- Plugins con novedades (config.deps); clic izquierdo abre el changelog de :DepsUpdate
local function section_deps()
  local count = #require("config.deps").outdated
  if count == 0 then return "" end
  return string.format("%%@v:lua.StatuslineDepsUpdate@%%#StatuslineDepsOutdated#󰏗 %d", count)
end

-- Igual que el contenido por defecto de mini.statusline, más section_venv y section_deps
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
    { hl = "MiniStatuslineDevinfo", strings = { section_venv(), section_deps() } },
    { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
    { hl = mode_hl, strings = { search, location } },
  })
end

require("mini.statusline").setup({ content = { active = content_active } })

-- Color de aviso (fg de DiagnosticWarn sobre el fondo del grupo); se reaplica al cambiar de tema
local function deps_highlight()
  local warn = vim.api.nvim_get_hl(0, { name = "DiagnosticWarn", link = false })
  local devinfo = vim.api.nvim_get_hl(0, { name = "MiniStatuslineDevinfo", link = false })
  vim.api.nvim_set_hl(0, "StatuslineDepsOutdated", { fg = warn.fg, bg = devinfo.bg })
end
deps_highlight()
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("jorgejhms_deps_highlight", { clear = true }),
  callback = deps_highlight,
})

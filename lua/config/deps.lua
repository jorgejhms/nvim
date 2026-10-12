-- Gestión de plugins con mini.deps: indicador de novedades y atajos bajo <Leader>p
local M = {}

---@type string[] Plugins con commits nuevos en su origen (para la statusline)
M.outdated = {}

---@type table<string, string> Hash de HEAD en el origen, por plugin
local remote_heads = {}

local function git(args, callback)
  vim.system(
    vim.list_extend({ "git" }, args),
    { text = true, timeout = 15000, env = { GIT_TERMINAL_PROMPT = "0" } },
    callback
  )
end

local function first_hash(obj) return obj.code == 0 and obj.stdout:match("^(%x+)") or nil end

-- Compara el HEAD local con el último HEAD remoto conocido (sin red)
local function recompute(specs, on_done)
  local pending, outdated = #specs, {}
  for _, spec in ipairs(specs) do
    git({ "-C", spec.path, "rev-parse", "HEAD" }, function(obj)
      local local_head, remote_head = first_hash(obj), remote_heads[spec.name]
      if local_head and remote_head and local_head ~= remote_head then table.insert(outdated, spec.name) end
      pending = pending - 1
      if pending > 0 then return end
      vim.schedule(function()
        table.sort(outdated)
        M.outdated = outdated
        vim.cmd.redrawstatus({ bang = true })
        if on_done then on_done(#outdated) end
      end)
    end)
  end
end

-- Consulta el origen de cada plugin (`ls-remote`, sin descargar nada) y recalcula
function M.check(on_done)
  local specs = MiniDeps.get_session()
  local pending = #specs
  for _, spec in ipairs(specs) do
    git({ "-C", spec.path, "ls-remote", "origin", "HEAD" }, function(obj)
      remote_heads[spec.name] = first_hash(obj)
      pending = pending - 1
      if pending == 0 then recompute(specs, on_done) end
    end)
  end
end

local function notify_outdated(count)
  if count == 0 then return vim.notify("Todos los plugins están al día") end
  local noun = count == 1 and "plugin con novedades" or "plugins con novedades"
  vim.notify(string.format("%d %s (<Leader>pu para ver los cambios)", count, noun))
end

function M.setup()
  local map = function(lhs, rhs, desc) vim.keymap.set("n", "<Leader>p" .. lhs, rhs, { desc = desc }) end

  map("u", "<Cmd>DepsUpdate<CR>", "Actualizar plugins (muestra los cambios)")
  map("c", "<Cmd>DepsUpdateOffline<CR>", "Revisar cambios ya descargados")
  map("l", "<Cmd>DepsShowLog<CR>", "Ver el log de actualizaciones")
  map("d", "<Cmd>DepsClean<CR>", "Eliminar plugins sin uso")
  map("s", "<Cmd>DepsSnapSave<CR>", "Guardar snapshot de plugins")
  map("S", "<Cmd>DepsSnapLoad<CR>", "Restaurar snapshot de plugins")
  map("r", function() M.check(notify_outdated) end, "Buscar novedades de plugins")

  -- mini.deps no emite eventos: el buffer de confirmación se elimina cuando la actualización terminó
  vim.api.nvim_create_autocmd("BufWipeout", {
    group = vim.api.nvim_create_augroup("jorgejhms_deps_refresh", { clear = true }),
    pattern = "minideps://*/confirm-update",
    callback = function() recompute(MiniDeps.get_session()) end,
    desc = "Refresca el indicador de plugins tras actualizar",
  })

  M.check(function(count)
    if count > 0 then notify_outdated(count) end
  end)
end

return M

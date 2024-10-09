local map = vim.keymap.set

require("mini.animate").setup({
  scroll = {
    -- Desactiva animaciones de scroll que interfieren con el scroll del mouse
    enable = false,
  },
})

-- Bufremove
require("mini.bufremove").setup({
  keys = {
    {
      "<leader>bd",
      function() require("mini.bufremove").delete(0) end,
      desc = "Cerrar buffer",
    },
  },
})

-- Mini Clue
local miniclue = require("mini.clue")
miniclue.setup({
  triggers = {
    -- Leader triggers
    { mode = "n", keys = "<Leader>" },
    { mode = "x", keys = "<Leader>" },

    -- Local leader
    { mode = "n", keys = "\\" },
    { mode = "x", keys = "\\" },

    -- Built-in completion
    { mode = "i", keys = "<C-x>" },

    -- `g` key
    { mode = "n", keys = "g" },
    { mode = "x", keys = "g" },

    -- Marks
    { mode = "n", keys = "'" },
    { mode = "n", keys = "`" },
    { mode = "x", keys = "'" },
    { mode = "x", keys = "`" },

    -- Registers
    { mode = "n", keys = '"' },
    { mode = "x", keys = '"' },
    { mode = "i", keys = "<C-r>" },
    { mode = "c", keys = "<C-r>" },

    -- Window commands
    { mode = "n", keys = "<C-w>" },

    -- `z` key
    { mode = "n", keys = "z" },
    { mode = "x", keys = "z" },

    -- Bracket movements
    { mode = "n", keys = "[" },
    { mode = "n", keys = "]" },
    { mode = "x", keys = "[" },
    { mode = "x", keys = "]" },
  },

  clues = {
    -- Leader groups
    { mode = "n", keys = "<Leader>b", desc = "+Buffers" },
    { mode = "n", keys = "<Leader>c", desc = "+Code" },
    { mode = "n", keys = "<Leader>cc", desc = "+Copilot" },
    { mode = "n", keys = "<Leader>d", desc = "+Diagnostics" },
    { mode = "n", keys = "<Leader>g", desc = "+Git" },
    { mode = "n", keys = "<Leader>gh", desc = "+Git Hunks" },
    { mode = "n", keys = "<Leader>s", desc = "+Search" },
    { mode = "n", keys = "<Leader>u", desc = "+UI" },
    { mode = "n", keys = "<Leader>x", desc = "+Trouble" },
    -- TODO: Completar mappings

    -- Enhance this by adding descriptions for <Leader> mapping groups
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },

  window = {
    config = {
      width = "auto",
    },
  },
})

-- Mini Comment
require("mini.comment").setup({
  options = {
    custom_commentstring = function()
      return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
    end,
  },
})

-- Mini Diff
local MiniDiff = require("mini.diff")
MiniDiff.setup({
  view = {
    style = "sign",
    signs = {
      add = "▎",
      change = "▎",
      delete = "",
    },
  },
})

map("n", "<Leader>ghp", function() MiniDiff.toggle_overlay(0) end, { desc = "Muestra diferencias en Git" })

-- Mini Files
require("mini.files").setup({
  mappings = {
    show_help = "?", -- Maping original parece que tiene conflicto
  },
})
map("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>", { desc = "Abre MiniFiles" })
map(
  "n",
  "<leader>E",
  "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>",
  { desc = "Abre MiniFiles (muestra archivo actual)" }
)

-- Mini Icons
local MiniIcons = require("mini.icons")
MiniIcons.setup({
  lsp = {
    ["codeium"] = { glyph = "󰘦 ", hl = "MiniIconsPurple" }, -- Icono Codeium
    ["function"] = { glyph = "󰊕" },
    snippet = { glyph = " " },
  },
})
MiniIcons.mock_nvim_web_devicons()
MiniIcons.tweak_lsp_kind()

-- Mini indent scope
require("mini.indentscope").setup({
  symbol = "│",
})

-- Mini Map
local minimap = require("mini.map")
require("mini.map").setup({
  integrations = {
    minimap.gen_integration.builtin_search(),
    minimap.gen_integration.diff(),
    minimap.gen_integration.diagnostic(),
  },
})
map("n", "<Leader>mt", function() MiniMap.toggle() end, { desc = "Alterna minimapa" })
map("n", "<Leader>mf", function() MiniMap.toggle_focus() end, { desc = "Alterna minimapa" })
map("n", "<Leader>mr", function() MiniMap.refresh() end, { desc = "Alterna minimapa" })

-- Mini Pick
require("mini.pick").setup()
vim.ui.select = MiniPick.ui_select

local win_config = function()
  local height = math.floor(0.3 * vim.o.lines)
  local width = math.floor(0.3 * vim.o.columns)
  return {
    anchor = "NW",
    height = height,
    width = width,
    row = math.floor(0.5 * (vim.o.lines - height)),
    col = math.floor(0.5 * (vim.o.columns - width)),
  }
end

-- MiniPick Colorscheme Picker
local set_colorscheme = function(name)
  pcall(function() vim.cmd("Colorscheme " .. name) end)
end
local pick_colorscheme = function()
  local init_scheme = vim.g.colors_name
  local new_scheme = MiniPick.start({
    source = {
      name = "Colorscheme",
      items = vim.fn.getcompletion("", "color"),
      choose = set_colorscheme,
    },
    mappings = {
      move_down = "<C-n>",
      move_start = "<C-g>",
      move_up = "<C-p>",
      preview = {
        char = "<Tab>",
        func = function()
          local item = MiniPick.get_picker_matches()
          if item and item.current then pcall(function() vim.cmd("colorscheme " .. item.current) end) end
        end,
      },
    },
    window = { config = win_config },
  })
  if new_scheme == nil then set_colorscheme(init_scheme) end
end

-- Mini picker spellsuggest
local spellsuggest = function()
  local local_opts = { n_suggestions = 5 } -- Define el número de sugerencias a mostrar
  local opts = {
    mappings = {
      caret_left = "<Left>",
      caret_right = "<Right>",

      choose = "<CR>",

      delete_char = "<BS>",
      delete_char_right = "<Del>",
      delete_left = "<C-u>",
      delete_word = "<C-w>",

      move_down = "<C-n>",
      move_start = "<C-g>",
      move_up = "<C-p>",

      scroll_down = "<C-f>",
      scroll_left = "<C-h>",
      scroll_right = "<C-l>",
      scroll_up = "<C-b>",

      stop = "<Esc>",
    },
    window = {
      config = {
        relative = "cursor",
        anchor = "NW",
        row = 1,
        col = 0,
        width = 40,
        height = 5,
      },
    },
  }
  MiniExtra.pickers.spellsuggest(local_opts, opts)
end

-- TODO: Cambiar a lua
-- Keymaps
map("n", "<Leader><Leader>", "<cmd>Pick files<CR>", { desc = "[P]ick [F]iles" })
map("n", "<Leader>sf", "<cmd>Pick files<CR>", { desc = "[S]earch [F]iles" })
map("n", "<Leader>sk", "<cmd>Pick keymaps<CR>", { desc = "[P]ick [K]eymaps" })
map("n", "<Leader>sh", "<cmd>Pick help<CR>", { desc = "[S]earch [H]elp" })
map("n", "<Leader>sb", "<cmd>Pick buffers<CR>", { desc = "[S]earch [B]uffers" })
map("n", "<Leader>sc", "<cmd>Pick commands<CR>", { desc = "[S]earch [C]ommands" })
map("n", "<Leader>sm", "<cmd>Pick marks<CR>", { desc = "[S]earch [M]arks" })
map("n", "<Leader>so", "<cmd>Pick options<CR>", { desc = "[S]earch [O]ptions" })
map("n", "<Leader>s.", "<cmd>Pick oldfiles<CR>", { desc = "[S]earch [R]ecent files" })
map("n", "<Leader>sd", "<cmd>Pick diagnostic<CR>", { desc = "[S]earch [D]iagnostics" })
-- map("n", "<Leader>sr", "<cmd>Pick resume<CR>", { desc = "[S]earch [R]esume" })
map("n", "<Leader>sg", "<cmd>Pick grep_live<CR>", { desc = "[S]earch [G]rep" })
map("n", "z=", spellsuggest, { desc = "Abre las sugerencias ortográficas" })
map("n", "<Leader>/", "<cmd>Pick buf_lines scope='current'<CR>", { desc = "[/] Fuzzily search in current buffer" })
map("n", "<Leader>s/", "<cmd>Pick buf_lines<CR>", { desc = "[S]earch [/] in Open Files" })
map("n", "<leader>fc", pick_colorscheme, { noremap = true, silent = true, desc = "Change Colorscheme" })
map("n", "<Leader>sr", function() MiniExtra.pickers.registers() end, { desc = "Buscar registros" })

-- Surround
require("mini.surround").setup({
  mappings = {
    add = "gsa", -- Add surrounding in Normal and Visual modes
    delete = "gsd", -- Delete surrounding
    find = "gsf", -- Find surrounding (to the right)
    find_left = "gsF", -- Find surrounding (to the left)
    highlight = "gsh", -- Highlight surrounding
    replace = "gsr", -- Replace surrounding
    update_n_lines = "gsn", -- Update `n_lines`
  },
})

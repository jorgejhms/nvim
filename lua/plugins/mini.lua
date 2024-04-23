-- Basic mini modules
-- Better Around/Inside textobjects
require("mini.ai").setup({ n_lines = 500 })

require("mini.starter").setup({})
require("mini.sessions").setup()
require("mini.animate").setup()

-- Navegación de archivos
require("mini.files").setup({
  mappings = {
    show_help = "?", -- Maping original parece que tiene conflicto
  },
})
vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>", { desc = "Abre MiniFiles" })
vim.keymap.set(
  "n",
  "<leader>E",
  "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>",
  { desc = "Abre MiniFiles (muestra archivo actual)" }
)

-- bufremove
require("mini.bufremove").setup({
  keys = {
    {
      "<leader>bd",
      function()
        require("mini.bufremove").delete(0)
      end,
      desc = "Cerrar buffer",
    },
  },
})

-- Mini Diff no da funcionalidad completa aún
-- require("mini.diff").setup({
--   view = {
--     style = "sign",
--     signs = {
--       add = "+",
--       change = "~",
--       delete = "",
--     },
--   },
-- })
--
-- vim.keymap.set("n", "<leader>ug", "<cmd>lua MiniDiff.toggle_overlay()<CR>", { desc = "Toggle diff overlay" })
--
require("mini.bracketed").setup()
require("mini.splitjoin").setup({})
require("mini.cursorword").setup()
require("mini.move").setup()
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

-- Add/delete/replace surroundings (brackets, quotes, etc.)
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

-- Simple and easy statusline.
local statusline = require("mini.statusline")
-- set use_icons to true if you have a Nerd Font
statusline.setup({ use_icons = vim.g.have_nerd_font })

require("mini.tabline").setup({
  tabpage_section = "right",
})

-- You can configure sections in the statusline by overriding their
-- default behavior. For example, here we set the section for
-- cursor location to LINE:COLUMN
--	-@diagnostic disable-next-line: duplicate-set-field
-- statusline.section_location = function()
-- return "%2l:%-2v"
-- end
--
-- Indent lines
require("mini.indentscope").setup()
require("mini.pairs").setup()

-- require("mini.hues").setup({ background = "#10262c", foreground = "#c0c8cb" })

-- comments
require("mini.comment").setup({
  -- Usa ts_context_commentstring para obtener el comentario correcto
  options = {
    custom_commentstring = function()
      return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
    end,
  },
})

require("mini.pick").setup()
-- Keymaps
vim.keymap.set("n", "<Leader><Leader>", "<cmd>Pick files<CR>", { desc = "[P]ick [F]iles" })
vim.keymap.set("n", "<Leader>sf", "<cmd>Pick files<CR>", { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<Leader>sk", "<cmd>Pick keymaps<CR>", { desc = "[P]ick [K]eymaps" })
vim.keymap.set("n", "<Leader>sh", "<cmd>Pick help<CR>", { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<Leader>sb", "<cmd>Pick buffers<CR>", { desc = "[S]earch [B]uffers" })
vim.keymap.set("n", "<Leader>sc", "<cmd>Pick commands<CR>", { desc = "[S]earch [C]ommands" })
vim.keymap.set("n", "<Leader>sm", "<cmd>Pick marks<CR>", { desc = "[S]earch [M]arks" })
vim.keymap.set("n", "<Leader>so", "<cmd>Pick options<CR>", { desc = "[S]earch [O]ptions" })
vim.keymap.set("n", "<Leader>s.", "<cmd>Pick oldfiles<CR>", { desc = "[S]earch [R]ecent files" })
vim.keymap.set("n", "<Leader>sd", "<cmd>Pick diagnostics<CR>", { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<Leader>sr", "<cmd>Pick resume<CR>", { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<Leader>sg", "<cmd>Pick grep_live<CR>", { desc = "[S]earch [G]rep" })
vim.keymap.set("n", "z=", "<cmd>Pick spellsuggest<CR>", { desc = "Abre las sugerencias ortográficas" })
vim.keymap.set(
  "n",
  "<Leader>/",
  "<cmd>Pick buf_lines scope='current'<CR>",
  { desc = "[/] Fuzzily search in current buffer" }
)
vim.keymap.set("n", "<Leader>s/", "<cmd>Pick buf_lines<CR>", { desc = "[S]earch [/] in Open Files" })

-- Carga extra pickers
require("mini.extra").setup()

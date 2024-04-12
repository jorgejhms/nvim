-- Basic mini modules
-- Better Around/Inside textobjects
require("mini.ai").setup({ n_lines = 500 })

-- Files navigation
require("mini.files").setup()
vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>")

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

require("mini.cursorword").setup()
require("mini.move").setup()
local miniclue = require("mini.clue")
miniclue.setup({
  triggers = {
    -- Leader triggers
    { mode = "n", keys = "<Leader>" },
    { mode = "x", keys = "<Leader>" },

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
  },

  clues = {
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

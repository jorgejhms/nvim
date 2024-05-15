local map = vim.keymap.set

require("mini.pick").setup()

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
  pcall(function()
    vim.cmd("colorscheme " .. name)
  end)
end
local pick_colorscheme = function()
  local init_scheme = vim.g.colors_name
  local new_scheme = MiniPick.start({
    source = {
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
          if item and item.current then
            pcall(function()
              vim.cmd("colorscheme " .. item.current)
            end)
          end
        end,
      },
    },
    window = { config = win_config },
  })
  if new_scheme == nil then
    set_colorscheme(init_scheme)
  end
end

-- Mini picker spellsuggest
local spellsuggest = function()
  local local_opts = { n_suggestions = 5 } -- You can adjust the number of suggestions as needed
  local opts = {
    mappings = {
      caret_left = "<Left>",
      caret_right = "<Right>",

      choose = "<CR>",
      choose_in_split = "<C-s>",
      choose_in_tabpage = "<C-t>",
      choose_in_vsplit = "<C-v>",
      choose_marked = "<M-CR>",

      delete_char = "<BS>",
      delete_char_right = "<Del>",
      delete_left = "<C-u>",
      delete_word = "<C-w>",

      mark = "<C-x>",
      mark_all = "<C-a>",

      move_down = "<C-n>",
      move_start = "<C-g>",
      move_up = "<C-p>",

      paste = "<C-r>",

      refine = "<C-Space>",
      refine_marked = "<M-Space>",

      scroll_down = "<C-f>",
      scroll_left = "<C-h>",
      scroll_right = "<C-l>",
      scroll_up = "<C-b>",

      stop = "<Esc>",

      toggle_info = "<S-Tab>",
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
map("n", "<Leader>sr", "<cmd>Pick resume<CR>", { desc = "[S]earch [R]esume" })
map("n", "<Leader>sg", "<cmd>Pick grep_live<CR>", { desc = "[S]earch [G]rep" })
map("n", "z=", spellsuggest, { desc = "Abre las sugerencias ortográficas" })
map("n", "<Leader>/", "<cmd>Pick buf_lines scope='current'<CR>", { desc = "[/] Fuzzily search in current buffer" })
map("n", "<Leader>s/", "<cmd>Pick buf_lines<CR>", { desc = "[S]earch [/] in Open Files" })
map("n", "<leader>fc", pick_colorscheme, { noremap = true, silent = true, desc = "Change Colorscheme" })

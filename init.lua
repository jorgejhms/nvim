-- vim.cmd[[so ~/.config/nvim/config/plugins.vim    " Load all plugins]]
vim.cmd[[so ~/.config/nvim/config/nvim-r.vim     " Nvim-R settigns]]
vim.cmd[[so ~/.config/nvim/config/lazygit.vim    " Lazygit]]

-- Carga opciones básicas
require("core.options")
-- require("core.colors")
require("core.maps")
require("core.lazy")

-- Loading plugins
-- require("gitsigns").setup()             -- Load gitsigns
-- require("nvim-autopairs").setup{}       -- Load autopars
-- require("nvim-lsp-installer").setup {}  -- Load LSP installer
-- require("virt-column").setup()
-- vim.notify = require("notify")
-- require("mini.cursorword").setup()
-- -- require("mini.map").setup()
-- require("barbecue").setup()
-- require("toggleterm").setup()

-- -- config files
-- require("config.telescope")             -- /lua/config/telescope.lua
-- require("plugins.cmp")
-- require("plugins.navic")
-- require("config.nvim-tree")             -- /lua/config/nvim-tree.lua
-- require("config.treesitter")            -- /lua/config/treesitter.lua
-- require("config.lualine")               -- /lua/config/lualine.lua
-- require("plugins.lsp")                   -- /lua/config/lsp.lua
-- require("config.nvim-web-devicons")     -- /lua/config/nvim-web-devicons.lua
-- require("plugins.iron")
-- require("plugins.emmet-ls")
-- require("plugins.indent-blankline")
-- require("plugins.tabline")
-- -- require("plugins.bufferline")
-- require("plugins.transparent")
-- require("plugins.session-manager")
-- require("plugins.lsp-saga")

vim.cmd 'color dracula'

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "dockerfile",
    "html",
    "lua",
    "markdown",
    "vim",
    "vimdoc",
    "json",
    "json5",
    "jsonc",
    "markdown",
    "markdown_inline",
    "r",
    "rnoweb",
    "ninja",
    "python",
    "rst",
    "toml",
    "typescript",
    "tsx",
    "yaml",
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  },
  -- Autoinstall languages that are not installed
  auto_install = true,
  highlight = {
    enable = true,
    -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
    --  If you are experiencing weird indenting issues, add the language to
    --  the list of additional_vim_regex_highlighting and disabled languages for indent.
    additional_vim_regex_highlighting = { "ruby" },
  },
  indent = { enable = true, disable = { "ruby" } },
  autotag = {
    enable = true,
  },
})
require("treesitter-context").setup({
  mode = "cursor",
  max_lines = 3,
})
require("ts_context_commentstring").setup({
  enable_autocmd = false,
})
require("nvim-ts-autotag").setup({
  enable_close = true,
  enable_rename = true,
  enable_colse_on_slash = true,
})

require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = {
        "astro",
        "css",
        "dockerfile",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "php",
        "python",
        "r",
        "scss",
        "vim",
        "yaml",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- List of parsers to ignore installing (for "all")
    ignore_install = {},

    highlight = {
        -- `false` will disable the whole extension
        enable = true,
        -- list of language that will be disabled
        disable = {},
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },

    --- Rainbow parenthesis
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },

    indent = {
        enable = true
    },

    -- Context comment string
    context_commentstring = {
        enable = true
    }
}

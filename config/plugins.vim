" =============================================================================
"
"  Plugins
"
" =============================================================================

" Configuration using last version of VIM-Plug
" https://github.com/junegunn/vim-plug

" Plugins list began here:
" ------------------------

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" -----------------------------------------------------------------------------
" 1.1 Themes:
" -----------------------------------------------------------------------------

Plug 'Mofiqul/dracula.nvim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }        " OneHalf Theme
Plug 'shaunsingh/nord.nvim'
Plug 'ayu-theme/ayu-vim'                      " Ayu Theme
Plug 'artanikin/vim-synthwave84'              " SynthWave 84'
Plug 'rakr/vim-one'                           " Vim-One
Plug 'NLKNguyen/papercolor-theme'             " Papercolor theme
Plug 'gosukiwi/vim-atom-dark'                 " Atom-Dark
Plug 'kyoz/purify'                            " Purify
Plug 'ishan9299/nvim-solarized-lua'
Plug 'sickill/vim-monokai'                    " Monokai
Plug 'sainnhe/sonokai'                        " Sonokai
Plug 'sainnhe/edge'
Plug 'rafamadriz/neon'
Plug 'marko-cerovac/material.nvim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'folke/tokyonight.nvim'
Plug 'mhartington/oceanic-next'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'EdenEast/nightfox.nvim' " Vim-Plug

" -----------------------------------------------------------------------------
" 1.2 General plugins:
" -----------------------------------------------------------------------------

" Basic plugins
Plug 'nvim-lualine/lualine.nvim'      " Statusline
Plug 'kyazdani42/nvim-tree.lua'
Plug 'tpope/vim-surround'             " Suround motions
Plug 'p00f/nvim-ts-rainbow'           " rainbow parentesis
Plug 'windwp/nvim-autopairs'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lukas-reineke/virt-column.nvim'
Plug 'f-person/git-blame.nvim'
Plug 'mg979/vim-visual-multi'
Plug 'rcarriga/nvim-notify'
Plug 'kdheepak/tabline.nvim'
Plug 'xiyaowong/nvim-transparent'
Plug 'utilyre/barbecue.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'SmiteshP/nvim-navic'
Plug 'hkupty/iron.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
Plug 'Shatur/neovim-session-manager'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'glepnir/lspsaga.nvim'

" Mini
" Plug 'echasnovski/mini.animate'
Plug 'echasnovski/mini.cursorword'
" Plug 'echasnovski/mini.indentscope'
Plug 'echasnovski/mini.map'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LSP
Plug 'neovim/nvim-lspconfig'                  " Enable LSP 
Plug 'williamboman/nvim-lsp-installer'        " LSP installer
Plug 'SmiteshP/nvim-navic'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'

" Comentarios
Plug 'tpope/vim-commentary'           " Easy comment lines
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

" Telescope
Plug 'nvim-lua/plenary.nvim'          " Telescope requirement
Plug 'nvim-telescope/telescope.nvim'  " Fuzzy finder

" Git
Plug 'lewis6991/gitsigns.nvim'        " Git status in line number
Plug 'kdheepak/lazygit.nvim'

" CSV
Plug 'mechatroner/rainbow_csv'        " Rainwow CSV

" Webdev
Plug 'ap/vim-css-color'               " CSS colors
" Plug 'mattn/emmet-vim'                " Emmet
Plug 'lumiliet/vim-twig'              " Twig support
Plug 'pangloss/vim-javascript'        " JS support
Plug 'MaxMEllon/vim-jsx-pretty'       " JSX support
Plug 'peitalin/vim-jsx-typescript'    " Typescript support
Plug 'leafgarland/typescript-vim'     " Typescript support
Plug 'adelarsq/vim-matchit'           " Match html tags pairs
Plug 'rajasegar/vim-astro', {'branch': 'main'} " Astro support
Plug 'alvan/vim-closetag'                     " HTML tag completition
Plug 'aca/emmet-ls'

" R
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'vim-pandoc/vim-pandoc-syntax'

" VIM-Markdown
Plug 'godlygeek/tabular', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'SidOfc/mkdx', {'for': 'markdown'}

" Initialize plugin system
call plug#end()

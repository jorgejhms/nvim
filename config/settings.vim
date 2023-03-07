" =============================================================================
"
" General configuration
"
" =============================================================================

" set exrc                        " Allows reading of vimrc on current directory
" set syntax=on                   " highlight syntax
" set fileencoding=utf-8
" set signcolumn=yes
" set relativenumber              " show line numbers relative
" set nu                          " show current line number
" set linebreak                   " Break lines at word (requires Wrap lines)
" set textwidth=0                 " Line wrap (number of cols)
" set wrap linebreak              " Soft wrap
" set showmatch                   " Highlight matching brace
" set noerrorbells                " Disable error bells
" set hlsearch                    " Highlight all search results
" set nohlsearch                  " Remove highlight after search
" set smartcase                   " Enable smart-case search
" set ignorecase                  " Always case-insensitive
" set incsearch                   " Searches for strings incrementally
" set autoindent                  " Auto-indent new lines
" set expandtab                   " Use spaces instead of tabs
" set tabstop=4 softtabstop=4     " Number of tabs to use
" set shiftwidth=4                " Number of auto-indent spaces
" set smartindent                 " Enable smart-indent
" set smarttab                    " Enable smart-tabs
set laststatus=3                " Make sure Lightline starts with global statusline
set colorcolumn=80              " Color column 80
set clipboard=unnamed           " Usa el clipboard del sistema
set noshowmode                  " No muestra el modo de forma duplicada
set encoding=UTF-8              " Codificación UTF-8              
set showtabline=2               " Show tabline
set noswapfile
set scrolloff=8
" set cmdheight=0
set lazyredraw
set updatetime=250              " LSP
set mouse=a                     " Mouse supoort
set hidden

" Define color theme

" Set real colors
if has('termguicolors')
    set termguicolors
endif

" The configuration options should be placed before `colorscheme sonokai`.
" let g:sonokai_style = 'default'
" let g:sonokai_better_performance = 1
"
" Catppucin
let g:catppuccin_flavour = "macchiato" "latte, frappe, macchiato, mocha

colorscheme nord

" Transparent background
" hi Normal guibg=NONE ctermbg=NONE

" Integration of Goyo and Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Activate rainbow parenthesis
let g:rainbow_active = 1

" Kitty fix
" vim hardcodes background color erase even if the terminfo file does
" not contain bce (not to mention that libvte based terminals
" incorrectly contain bce in their terminfo files). This causes
" incorrect background rendering when using a color theme with a
" background color.
let &t_ut=''

" Neovide gui
set guifont=JetBrainsMono\ Nerd\ Font:h15
let g:neovide_transparency=0.9

" Set spelling for all markdown files
autocmd BufNewFile,BufRead *.md set spell spelllang=es

" Disable GitBlame on startup
let g:gitblame_enabled = 0

" -----------------------------------------------------------------------------
"  Nvim-R
" -----------------------------------------------------------------------------

" Nvim-R options
let R_auto_start = 2            " start R automaticly
let R_assing = 3                " Replace underscore
let rrst_syn_hl_chunk = 1       " Highlight chuck header
let rmd_syn_hl_chunk = 1        " Highlight chunk header
let R_openhtml = 1              " Open knit html automaticly
let R_openpdf = 1               " Open knit pdf automaticly
let g:markdown_fenced_languages = ['r', 'python']
let g:rmd_fenced_languages = ['r', 'python']

" R key bindings
augroup rvim
    autocmd! rvim
    autocmd Filetype r inoremap <buffer> <C-n> <Space><bar><Char-62> 
    autocmd Filetype rmd inoremap <buffer> <C-n> <Space><bar><Char-62>
augroup end

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

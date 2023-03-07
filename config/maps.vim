" =============================================================================
"
" Mappings
"
" =============================================================================

let mapleader=" "               " Use space as leader
let maplocalleader=","          " Map local leader a coma para R

" Mapping j k for visual lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" Toggle wrap lines

" Moving lines up or down like vscode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Relative or absolute number lines
"Relative with start point or with line number or absolute number lines
function! NumberToggle()
    if(&number == 1)
        set number!
        set relativenumber!
    elseif(&relativenumber==1)
        set relativenumber
        set number
    else
        set norelativenumber
        set number                                                  
    endif
endfunction

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fc <cmd>Telescope commands<cr>
nnoremap <leader>fd <cmd>Telescope lsp_document_symbols<cr>
nnoremap <leader>fw <cmd>Telescope lsp_workspace_symbols<cr>
nnoremap <Leader>fe :NvimTreeToggle<CR>


" Toggle
nnoremap <Leader>tz :Goyo<CR>
nnoremap <Leader>tn :call NumberToggle()<CR>
nnoremap <Leader>tw :set wrap!<CR>
nnoremap <Leader>tg :GitBlameToggle<CR>
nnoremap <Leader>tm :lua MiniMap.toggle()<CR>
nnoremap <Leader>tt :TransparentToggle<CR>
nnoremap <Leader>ti <cmd>:IndentBlanklineToggle!<cr>

" Open Git
nnoremap <Leader>gg :LazyGit<CR>

" Use telescope for spell suggest
nnoremap z= :Telescope spell_suggest<CR>

" Buffer movements
nnoremap <Leader>[  :TablineBufferPrevious<CR>
nnoremap <Leader>]  :TablineBufferNext<CR>
" nnoremap <Leader>bp  :BufferLineTogglePin<CR>
nnoremap <Leader>q :bdelete<CR>
nnoremap <Leader>w :w<CR>

" nnoremap <silent><leader>1 <Cmd>LualineBuffersJump 1<CR>
" nnoremap <silent><leader>2 <Cmd>LualineBuffersJump 2<CR>
" nnoremap <silent><leader>3 <Cmd>LualineBuffersJump 3<CR>
" nnoremap <silent><leader>4 <Cmd>LualineBuffersJump 4<CR>
" nnoremap <silent><leader>5 <Cmd>LualineBuffersJump 5<CR>
" nnoremap <silent><leader>6 <Cmd>LualineBuffersJump 6<CR>
" nnoremap <silent><leader>7 <Cmd>LualineBuffersJump 7<CR>
" nnoremap <silent><leader>8 <Cmd>LualineBuffersJump 8<CR>
" nnoremap <silent><leader>9 <Cmd>LualineBuffersJump $<CR>

" windows movements
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>

" Windows splits
nmap <silent> <A-s> :split <CR>
nmap <silent> <A-v> :vsplit <CR>

" Terminal
nnoremap <silent> <C-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent> <C-y> <Cmd>exe v:count1 . "ToggleTerm direction=vertical size=80"<CR>
nnoremap <silent> <c-a> :ToggleTermToggleAll <CR>
tnoremap <Esc> <C-\><C-n>

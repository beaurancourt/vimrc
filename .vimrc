set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-scripts/AutoClose'
Plugin 'bkad/CamelCaseMotion'
Plugin 'rking/ag.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'Floobits/floobits-neovim'
Plugin 'junegunn/fzf'
Plugin 'othree/html5.vim'
Plugin 'shime/livedown'
Plugin 'scrooloose/nerdcommenter'
Plugin 'karlbright/qfdo.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'Peeja/vim-cdo'
Plugin 'guns/vim-clojure-highlight'
Plugin 'guns/vim-clojure-static'
Plugin 'kchmck/vim-coffee-script'
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-dispatch'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'xolox/vim-easytags'
Plugin 'jeetsukumaran/vim-filebeagle'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'lambdalisue/vim-fullscreen'
Plugin 'justinmk/vim-gtfo'
Plugin 'tpope/vim-haml'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'xolox/vim-misc'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-obsession'
Plugin 'derekwyatt/vim-scala'
Plugin 'tpope/vim-sensible'
Plugin 'xolox/vim-session'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-surround'
Plugin 'beaushinkle/vim-mapping-syntax'
Plugin 'artnez/vim-wipeout'

" All of your Plugins must be added before the following line
call vundle#end()
syntax on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
syntax enable
set background=dark
call togglebg#map("<F5>")
colorscheme solarized
set diffopt+=vertical
set nowrap
set clipboard=unnamed
set nohlsearch
set splitright
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set ignorecase
set smartcase
set shell=bash
set showcmd
set guifont=Source\ Code\ Pro:h15
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_clear_cache_on_exit=0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/target/*,*.json,*.js,*.css,*/it-classes/*
noremap <C-S-]> :tabnext<CR>
noremap <C-S-[> :tabprev<CR>
set history=1000
let mapleader=","
set number
let g:ctrlp_by_filename = 1
set grepprg=ack
set hidden
set lazyredraw
set smartindent
set smarttab
set matchtime=2
set tabstop=2 shiftwidth=2 expandtab
set cc=121
let g:clojure_maxlines = 100
set complete=.,w,b,u,t,i
set tags=tags;/
set ttyfast
set mouse=a
nnoremap S diw"0P

nmap <leader>nt :vs<CR><C-w>h:vertical resize 60<CR>:term<CR>fish<CR>

nmap <leader>fr :RunTests<CR>
nmap <leader>fe :%Eval<CR>
nmap <leader>fc :Connect<CR>1<CR><CR>7888<CR><CR>
nmap <leader>ya :%y+<CR>

" Fugitive
nmap <leader>gg :Git 
nmap <leader>gs :Gstatus<CR>
nmap <leader>cm :Gcommit -a<CR>
nmap <C-b> :CtrlPBuffer<CR>
nnoremap <CR> :nohlsearch<CR><CR>
nnoremap <leader>s <C-w>l<C-w>l<C-w>h:vertical resize 260<CR><C-w>l:vertical resize 130<CR><C-w>k:resize 10<CR><C-w>j

nnoremap <leader>r :TagbarToggle<CR>
let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:aclasses',
        \ 'c:classes',
        \ 'r:cclasses',
        \ 'm:methods'
    \ ]
\ }
let g:SuperTabDefaultCompletionType = "context"
inoremap <expr> <Esc> pumvisible() ? '<C-y><Esc>' : '<Esc>'
nnoremap <silent><leader><C-]> <C-w><C-]><C-w>T

nnoremap <leader>t <C-w>h<C-w>h<C-w>h<C-w>ki<UP><UP><CR>ps<CR><Down><Down><Down><Down><C-\><C-n>i<C-\><C-n>
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nmap <Up> [e
nmap <Down> ]e
vmap <Up> [egv
vmap <Down> ]egv<F37>
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-W>k
tnoremap <C-h> <C-\><C-n><C-W>h
tnoremap <C-l> <C-\><C-n><C-W>l
tnoremap <ESC> <C-\><C-n>
tnoremap <Up> i<UP><CR><C-\><C-n>
let g:easytags_async = 1

"--------
"Multiple Cursors
"--------
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction
"--------
"End Multiple Cursors
"--------

let g:terminal_scrollback_buffer_size = 100000

let g:livedown_open = 1
let g:livedown_port = 1337

let g:sexp_enable_insert_mode_mappings = 0

let g:NERDCustomDelimiters = {
    \ 'vim-mapping-syntax': { 'left': ';'}
\ }
let g:session_autoload = 'no'

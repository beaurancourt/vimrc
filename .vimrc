set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'lifepillar/vim-solarized8'
Plugin 'lifepillar/vim-gruvbox8'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'beaushinkle/vim-mapping-syntax'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'flazz/vim-colorschemes'
Plugin 'guns/vim-clojure-highlight'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-sexp'
Plugin 'jeetsukumaran/vim-filebeagle'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'justinmk/vim-gtfo'
Plugin 'justinmk/vim-sneak'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-salve'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/ebnf.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'dzeban/vim-log-syntax'
Plugin 'othree/xml.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'neoclide/coc.nvim'
Plugin 'leafgarland/typescript-vim'

" All of your Plugins must be added before the following line
call vundle#end()

set nocompatible
filetype off
let g:session_autosave = 'no'
syntax on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
syntax enable

set termguicolors
set background=dark
colorscheme gruvbox8

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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/target/*,*/it-classes/*
xnoremap p "_dP
noremap <C-S-]> :tabnext<CR>
noremap <C-S-[> :tabprev<CR>
set history=1000
let mapleader=","
set number
set grepprg=ack
set hidden
set lazyredraw
set smarttab
set matchtime=2
set tabstop=2 shiftwidth=2 expandtab
set cc=121
let g:clojure_maxlines = 100
set complete=.,w,b,u,t,i
set tags=tags;~/merc/tags
set ttyfast
set mouse=a
vnoremap <C-c> "*y
nnoremap S diw"0P
nnoremap <F5> mr:let @/ = @"<CR>`r:set hlsearch<CR>

"---------
"FZF
"---------
let g:fzf_command_prefix = 'Fzf'
nnoremap <C-p> :FzfGFiles<CR>
nnoremap <C-b> :FzfBuffers<CR>
nnoremap K :FzfAg <C-R><C-W><CR>

nmap <leader><Tab> :b#<CR>
nmap <leader>nt :vs<CR><C-w>h:vertical resize 55<CR>:term<CR>ifish<CR>

nmap <leader>fr :RunTests<CR>
nmap <leader>fe :w<CR>:%Eval<CR>
nmap <leader>fc :Connect 7888<CR><CR>
nmap <leader>ya :%y+<CR>
nmap <leader>e V:Eval<CR>

" Fugitive
nmap <leader>gg :Git
nmap <leader>gs :Gstatus<CR>
nmap <leader>cm :Gcommit -a<CR>
nnoremap <CR> :set nohlsearch<CR><CR>:echo<CR>
nnoremap <leader>s <C-w>l<C-w>l<C-w>h:vertical resize 260<CR><C-w>l:vertical resize 130<CR><C-w>k:resize 10<CR><C-w>j0
nnoremap <leader>rb :SlimuxREPLSendBuffer<CR>

inoremap <expr> <Esc> pumvisible() ? '<C-y><Esc>' : '<Esc>'
nnoremap <silent><leader><C-]> <C-w><C-]><C-w>T

nnoremap <leader>w <C-w>h<C-w>h<C-w>h<C-w>ki<UP><CR><C-\><C-n><C-w>l

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nmap <Up> [e
nmap <Down> ]e
vmap <Up> [egv
vmap <Down> ]egv<F37>
tnoremap <C-h> <C-\><C-n><C-W>h
tnoremap <C-l> <C-\><C-n><C-W>l
noremap <leader>l icom.elemica.clojure.ReplLauncher.start<CR>
let g:easytags_async = 1

au BufRead,BufNewFile *.sbt set filetype=scala
autocmd FileType json syntax match Comment +\/\/.\+$+

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

let g:sexp_enable_insert_mode_mappings = 0

let g:NERDCustomDelimiters = {
    \ 'vim-mapping-syntax': { 'left': ';'}
\ }
let g:session_autoload = 'no'

au BufRead,BufNewFile *.go set noet ci pi sts=0 sw=2 ts=2

" Conquerer of Completion Stuff
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
set updatetime=300
set shortmess+=c
set signcolumn=yes
set nobackup
set nowritebackup
set cmdheight=2
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)

" Remap for do action format
nnoremap <silent> F :call CocAction('format')<CR>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

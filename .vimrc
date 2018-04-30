" Configure python version
if has('python3')
    command! -nargs=1 Py py3 <args>
    set pythonthreedll=/usr/local/Frameworks/Python.framework/Versions/3.6/Python
    set pythonthreehome=/usr/local/Frameworks/Python.framework/Versions/3.6
else
    command! -nargs=1 Py py <args>
    set pythondll=/usr/local/Frameworks/Python.framework/Versions/2.7/Python
    set pythonhome=/usr/local/Frameworks/Python.framework/Versions/2.7
endif

"Basic configuration
set encoding=utf-8
set nocompatible
set hidden
syntax on
filetype plugin indent on
set macligatures
set guifont=Fira\ Code:h16
set number " alwasys show line numbers
set laststatus=2 " set last status to normal mode
set noshowmode " hide mode text as lightline is installed
set nowrap " don't wrap lines
set tabstop=4 " 4 space tabs
set backspace=indent,eol,start " allow backspacing through everything in insert mode 
set autoindent
set copyindent
set shiftwidth=4 " set number of spaces to use for auto indenting; same with tabstop
set shiftround " use multiples of shiftwidth when indenting with > and <
set showmatch " show matching parens
set ignorecase " ignore case when searching
set smartcase " ignore case if search pattern is all lowercase
set smarttab " insert tabs on the start of line according to shiftwidth
set hlsearch " highlight search terms
set incsearch " show search matches as you type
set wildmenu " wild mode menu completion
set wildmode=list:longest
set ttyfast " enable fast terminal
set gdefault " global substitution by default
set mouse=a " enable mouse support

" History, undo and backup
set history=500
set undolevels=500
set title " change terminal's title
set visualbell " don't beep
set noerrorbells " don't beep
set nobackup " don't backup
set noswapfile

" Display whitespace
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'davidhalter/jedi-vim'
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'maralla/completor.vim'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'zah/nim.vim'
call plug#end()

" Style
let g:lightline = { 'colorscheme': 'one' }
colorscheme onedark

"Turn off auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Key Mapping
let mapleader=","
nnoremap ; :
"short cut for quitting insert mode
inoremap jk <Esc>
inoremap <Esc> <Nop>
"edit / source vimrc on the go
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" toggle absolute / relative line number
nnoremap <leader>ln :set rnu!<cr>
" completor shortcuts
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
" tab navigation
nnoremap tl :tabnext<cr>
nnoremap th :tabprev<cr>
nnoremap tn :tabnew<cr>
nnoremap td :tabclose<cr>
" toggle nerd tree
nnoremap <leader>nt :NERDTreeToggle<cr>

" rust configs
" let g:rustfmt_autosave=1
let g:completor_racer_binary='racer'
autocmd FileType rust nnoremap <buffer> <leader>b :RustRun<cr>

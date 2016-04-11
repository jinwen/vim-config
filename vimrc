" Load Vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" Core
Plugin 'gmarik/Vundle.vim'

" Colors
Plugin 'larssmit/vim-getafe'

" Langs
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-markdown'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-git'
Plugin 'pangloss/vim-javascript'
Plugin 'ajf/puppet-vim'
Plugin 'rosstimson/scala-vim-support'
Plugin 'nono/vim-handlebars'
Plugin 'kchmck/vim-coffee-script'
Plugin 'timcharper/textile.vim'
Plugin 'skwp/vim-rspec'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'vim-scripts/csv.vim'
Plugin 'mmalecki/vim-node.js'
Plugin 'vim-ruby/vim-ruby'
" Plugin 'vim-scripts/Arduino-syntax-file'
" Plugin 'tclem/vim-arduino'
Plugin 'vim-scripts/VimClojure'
Plugin 'groenewege/vim-less'
Plugin 'wlangstroth/vim-haskell'
Plugin 'digitaltoad/vim-jade'
Plugin 'aliva/vim-fish'
Plugin 'fatih/vim-go'

" Tools
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
" Plugin 'tpope/vim-endwise'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'msanders/snipmate.vim'
Plugin 'agate/vim-align'
Plugin 'vim-scripts/grep.vim'
Plugin 'mileszs/ack.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Lokaltog/vim-powerline'
Plugin 'kien/ctrlp.vim'
"Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-scripts/ZoomWin'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'edsono/vim-matchit'
Plugin 'sjl/gundo.vim'
Plugin 'tomtom/tlib_vim'

" Python
Plugin 'vim-scripts/indentpython.vim'

" Clojure
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'
"Plugin 'kien/rainbow_parentheses.vim'
"Plugin 'luochen1990/rainbow'

" -----------------------------------------------------------------------------
" My Settings Begin
" -----------------------------------------------------------------------------
" return to the last position when reopening file
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif

" General Setup
" -----------------------------------------------------------------------------
" Disable any beep
set noeb vb t_vb=

" Display commands in the bottom right corner as they are typed
set showcmd

" AugroupGet out of VI's compatible mode..
set nocompatible

" Disable backup
set nobackup
set nowritebackup

" Enable filetype plugin and indent
filetype plugin indent on

" Auto read when a file is changed from the outside
set autoread

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,chinese

set nobomb

" Foldmethod
set foldmethod=marker

" Backspace to delete
"set backspace=2
set backspace=indent,eol,start

" Use mouse
"set ttymouse=xterm
"set mouse=nv


" Colors
" -----------------------------------------------------------------------------
" Enable syntax hl
syntax on
colorscheme getafe
set cursorline
set colorcolumn=80
hi CursorLine guifg=NONE guibg=black gui=BOLD ctermfg=NONE ctermbg=black cterm=BOLD
hi ColorColumn ctermbg=black guibg=black


" Search
" -----------------------------------------------------------------------------
" Enable incremental search
set incsearch

" Highlight the search terms
set hlsearch

" Ignore case when searching
set ignorecase

" Enable smart match
set smartcase

" Wrap search when EOF is reached
set wrapscan


" Indenting and Tabbing
" -----------------------------------------------------------------------------
set autoindent
" Number of spaces used for (auto)indenting
set shiftwidth=2

" Number of spaces to insert for a <tab>
set tabstop=2
set softtabstop=2

" Insert spaces when the <tab> key is pressed
set expandtab

" Enable specific indenting for c-code and others and some nice options for cindenting
set cindent

" linenumber
set number

" Status
" -----------------------------------------------------------------------------
" Always display the status line
set laststatus=2

" format string
set statusline=%1*\File:\ %*%f%1*%5m%*%=\L%-5l\ \C%-4c%5p%%\ [%L\ \lines]

" Show the current editing status
set showmode

" Show special characters
set listchars=tab:▸\ ,trail:˽,eol:¶

" set backup stuff
set noswapfile
"set nobackup
"set nowritebackup


" Key maps
" -----------------------------------------------------------------------------
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l

" Map the arrow keys to be based on display lines, not physical lines
nmap <up> gk
nmap <down> gj

" Tab mappings
nmap <silent> <C-C> :tabnew <CR>
nmap <silent> <C-N> :tabnext<CR>
nmap <silent> <C-P> :tabprevious<CR>

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" remove all the ending white spaces
nmap <silent> <leader>d :%s/\s\+$//<CR>

" show invisible chars
nmap <silent> <leader>l :set list!<CR>

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Some helpers to edit mode
nmap <leader>ew :e    %:p:h/<CR>
nmap <leader>es :sp   %:p:h/<CR>
nmap <leader>ev :vs   %:p:h/<CR>
nmap <leader>etb :tabe %:p:h/<CR>

" HEX view
nmap <leader>16  :% !xxd<CR>
nmap <leader>16r :% !xxd -r<CR>


" GUI Settings
" -----------------------------------------------------------------------------
" Font
set guifont=Monaco:h14

" Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
nmap <silent> <F2> :if &guioptions =~# 'T' <Bar>
    \set guioptions-=T <Bar>
    \set guioptions-=m <bar>
\else <Bar>
    \set guioptions+=T <Bar>
    \set guioptions+=m <Bar>
\endif<CR>


" Additional filetypes
" -----------------------------------------------------------------------------
augroup filetypedetect
  autocmd! BufNewFile,BufRead *.js2,*.ms  setlocal ft=javascript
  autocmd! BufNewFile,BufRead *.pde,*.ino setlocal ft=arduino
augroup END


" Plugin Settings
" -----------------------------------------------------------------------------
" map <F3> for grep current word
let Grep_Default_Options = '-i -r --exclude=all-wcprops --exclude=entries --exclude=\*.swp --exclude=\*.tmp --exclude=\*.log'
nmap <silent> <F3> :Grep<CR>

" map <F3> for ack current word
"nmap <F3> :Ack!<SPACE>

" CtrlP
let g:ctrlp_map = '<C-F>'

" FuGitive
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

" GunDo
nmap <F5> :GundoToggle<CR>
imap <F5> <ESC>:GundoToggle<CR>

" ZoomWin
map <leader>zw :ZoomWin<CR>

" Config the NERDTree
nmap <silent>tt :NERDTreeToggle<CR>

" Config Powerline
let g:Powerline_symbols = 'fancy'

" Syntastic
"let g:syntastic_enable_signs   = 1
"let g:syntastic_quiet_warnings = 0
"let g:syntastic_auto_loc_list  = 2

" Config the Rspec
let g:RspecBin    = 'rspec'
let g:RspecRBPath = expand("~/").'.vim/bundle/vim-rspec/plugin/vim-rspec.vim'

" Config the Clojure
"let g:rainbow_active = 1

" Config the indent-guides
hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

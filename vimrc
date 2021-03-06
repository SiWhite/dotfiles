" Bye, vi
set nocompatible
syntax on
set encoding=utf-8
" Comma is an easier leader key to hit
let mapleader = ","

" Tabs are four spaces wide
set tabstop=4
" Newlines should start at the same level as the line above
set autoindent
" When indenting, indent by four spaces
set shiftwidth=4
" Always indent to a multiple of shiftwidth
set shiftround
" This is here to wrap Git commit messages to 72 chars.
filetype indent plugin on

" Display when in insert/visual/replace mode in the status bar
set showmode
" Show the number of selected characters in visual mode
set showcmd
" Allow hiding buffers that have changes
set hidden

" When changing buffers with :e, match with wildcards
set wildmenu
" Personal preference; I like the immediate visual feedback
set wildmode=list:longest

" Display a minimum of three lines above/below the cursor in the window
set scrolloff=3
" No audible bell
set visualbell
" For better redrawing, allegedly
set ttyfast
" Maintain a persistent undo file
set undofile

" Underline the current line
set cursorline
" Display the cursor's location in the file in the bottom right
set ruler
" Use relative line numbers rather than absolute ones
set relativenumber

set backspace=indent,eol,start
set laststatus=2

" Add in syntastic scss linter
let g:syntastic_scss_checkers = ['scss_lint']

" Pathogen is the nicest way to load plugins
call pathogen#infect()

" Always use Perl-style regular expressions
nnoremap / /\v
vnoremap / /\v

" Display invisibles
set list
set listchars=trail:·,precedes:«,extends:»,eol:¬,tab:▸\ 

" Folding
" Start with all folds collapsed
set foldlevelstart=0
nnoremap + za
vnoremap + za

" We're using a 256 colour terminal.
set t_Co=256

" The next few settings set up a nice find-as-you-type that ignores case when
" you want to but is case-sensitive when you want it to be as well
set ignorecase
set smartcase
set incsearch
set hlsearch
" Replace all occurences on a line by default; makes s///g go back to replacing
" just the first.
set gdefault
" Highlight matching brackets
set showmatch
" Type comma-space to clear search highlighting
nnoremap <leader><space> :noh<cr>
" Use tab to move through matching brackets/braces
nnoremap <tab> %
vnoremap <tab> %

" Soft-wrap text
set wrap
" Wrap at 72 chars wide
set textwidth=72
set formatoptions=qrn1

" Set .md files to Markdown syntax
au BufNewFile,BufRead *.md set filetype=markdown

" Space in normal mode centres the screen on the current line
nmap <space> zz

" Unmap arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Unmap help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" In insert mode, double-tap J to enter command mode.
inoremap jj <ESC>

" comma-W: strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" comma-A: start an Ack search
nnoremap <leader>a :Ack
" comma-S: sort CSS properties alphabetically
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
" comma-q: hard-wrap current paragraph
nnoremap <leader>q gqip
" comma-w: hard-wrap current line as though it was a paragraph
nnoremap <leader>w o<ESC>kgqip}dd
" comma-v: select the just-pasted text
nnoremap <leader>v V`]
" comma-=: align assignments in current block
nnoremap <leader>= :Tab /=<CR>
" comma-[: put array element on a new line
nnoremap <leader>[ f,a<CR><ESC>
" comma-t: toggle TagBar, a plugin that displays ctags in a sidebar
nnoremap <leader>t :TagbarToggle<CR>
" Select just-pasted text
nnoremap gp `[v`]

" map F4 key to listToggle
nmap <F4> :TlistToggle<cr>
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
" map F3 key to NERDTreeToggle
nmap <F3> :NERDTreeToggle<cr>

:nmap <c-s> :w<CR>
:imap <c-s> <ESC>:w<CR>a
:imap <c-s> <ESC><c-s>

set undofile
if has('win32') || has('win64')
	set undodir=$HOME/vimfiles/undo
else
	set undodir=$HOME/.vim/undo
endif
" backup to ~/.tmp
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

set undolevels=1000
set undoreload=10000

set background=dark
colorscheme solarized


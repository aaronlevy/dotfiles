set nocompatible
syntax on
filetype plugin indent on

" Colors / highlighting.
set t_Co=16                        " Set terminal to 16 colors
set background=dark
let g:solarized_visibility="high"  " Make whitespace more visible
set listchars=tab:>-,trail:.       " Whitespace characters to highlight
set list
let python_highlight_all=1
colorscheme solarized
set colorcolumn=79                 " Display line at column 79
set cursorline                     " Turn on cursor line
autocmd InsertEnter * set nocul    " Turn off cursor line in insert mode
autocmd InsertLeave * set cul

" Plugin options
let g:rustfmt_autosave = 1

" Disable arrow keys.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" General options
set modeline               " Use modelines
set modelines=5            " Look 5 lines in
set showmatch              " Show matching paren.
set scrolloff=5            " Keep 5 context lines above and below cursor
set sidescrolloff=15       " Keep 15 context characters when sidescrolling
set sidescroll=1           " Move one character at a time when sidescrolling
set splitright splitbelow  " Split windows to right or below
set nowrap                 " Do not wrap lines

" Status
set ruler                  " Show ruler
set showcmd                " Show normal mode commands as typed
set showmode               " Show current mode
set laststatus=2           " Always show statusline

" Indents
set nosmartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType go setlocal shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab nolist
autocmd FileType rust setlocal shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab nolist
autocmd FileType make setlocal shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab nolist

" Searching
set ignorecase             " Case insensitive search
set smartcase              " Unless uppercase included in term
set incsearch              " Incrementally search while typing
set nohls                  " No highlight of searches

" Backup, swap, undo
set undofile               " Undo across sessions
set undolevels=200         " Keep 200 changes to be undone
set backup                 " Backup current file
set writebackup            " Make backup of original when writing

" Backup, swap, undo directories. Trailing // keeps full path in filename
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//

" <F2> Turn off autoindent while pasting.
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" <F3> Toggle between tabs and spaces
noremap <F3> :set invexpandtab expandtab?<CR>

" <F5> Remove all trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

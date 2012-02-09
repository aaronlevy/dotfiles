" Load plugins using Pathogen.
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

" Colors / highlighting.
syntax enable
set t_Co=16
set background=dark
let g:solarized_visibility="high"  " Make whitespace more visible
set listchars=tab:>-,trail:.       " Whitespace characters to highlight
set list
let python_highlight_all=1
colorscheme solarized

autocmd FileType python compiler pylint
let g:pylint_onwrite = 0

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
set nocompatible           " Vim goodies
set modeline               " Use modelines
set modelines=5            " Look 5 lines in
set showmatch              " Show matching paren.
set scrolloff=3            " Keep 3 context lines above and below cursor
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
autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2

" Searching
set ignorecase             " Case insensitive search
set smartcase              " Unless uppercase included in term
set incsearch              " Incrementally search while typing
set nohls                  " No highlight of searches

" Backup and swap
set backup
set writebackup                    " Make backup of original when writing
set backupdir=~/.vim/tmp/backup//  " Trailing // keeps full path in filename
set directory=~/.vim/tmp/swap//

" show a line at column 79
if exists("&colorcolumn")
    set colorcolumn=79
endif

" <F2> Turn off autoindent while pasting.
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>


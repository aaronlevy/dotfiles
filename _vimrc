set nocompatible
set encoding=utf-8
syntax on
filetype plugin indent on

" Colors / highlighting.
set t_Co=16                        " Set terminal to 16 colors
set background=dark
let g:solarized_visibility="high"  " Make whitespace more visible
set listchars=tab:>-,trail:.       " Whitespace characters to highlight
set list

let g:go_highlight_types=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_function_calls=1
let g:go_highlight_operators=1
let g:go_highlight_extra_types=1
let g:go_auto_type_info = 1
let python_highlight_all=1

colorscheme solarized
"set mouse=a                        " I've finally broken
set colorcolumn=79                 " Display line at column 79
set cursorline                     " Turn on cursor line
set cursorlineopt=line             " Don't highlight number column
set number                         " Show line numbers
set signcolumn=number              " Show signs in the line number column
set switchbuf+=usetab,newtab       " Quickfix / locationlist should open in tabs
autocmd InsertEnter * set nocul    " Turn off cursor line in insert mode
autocmd InsertLeave * set cul

" Plugin options
let g:rustfmt_autosave = 1

" General options
set modeline                   " Use modelines
set modelines=5                " Look 5 lines in
set showmatch                  " Show matching paren.
set scrolloff=5                " Keep 5 context lines above and below cursor
set sidescrolloff=15           " Keep 15 context characters when sidescrolling
set sidescroll=1               " Move one character at a time when sidescrolling
set splitright splitbelow      " Split windows to right or below
set nowrap                     " Do not wrap lines
set backspace=indent,eol,start " Make backspace behave normally
set wildmenu                   " Use wildmenu
set wildmode=longest:full,full " Match longest common string, then full match

" File browsing
let g:netrw_liststyle = 1    " Long listing style, but toggles to tree view with Lexplore
let g:netrw_banner = 0       " Remove help banner
let g:netrw_winsize = 20     " Split should take 20% of screen
let g:netrw_altv = 1         " Left split
let g:netrw_browse_split = 0 " Default to same window, but toggles to new tab with Lexplore

" Status
set ruler                  " Show ruler
set showcmd                " Show normal mode commands as typed
set showmode               " Show current mode
set laststatus=2           " Always show statusline
set updatetime=100         " Update status delay in ms

" Indents
set nosmartindent
set expandtab              " Convert tabs to spaces
set shiftwidth=4           " Shift indent using 4 spaces
set tabstop=4              " Indent using 4 spaces
set softtabstop=4          " Move cursor 4 spaces on tab
set shiftround             " Round shifted indentation to the nearest multiple of shiftwidth
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

" Key Mappings

" Leader-e: Open file explorer in same directory as current file
nnoremap <silent> <leader>e :call LexploreToggle()<cr>
let g:lexplore_open = 0
function! LexploreToggle()
    if g:lexplore_open
        Lexplore
        " Reset closer to defaults when Lexplore not being used.
        let g:netrw_liststyle = 1    " Long listing style
        let g:netrw_browse_split = 0 " Open files in same window.
        let g:lexplore_open = 0
    else
        let g:netrw_liststyle = 3    " Tree view
        let g:netrw_browse_split = 3 " Open files in new tab.
        Lexplore %:p:h
        let g:lexplore_open = 1
    endif
endfunction

" Leader-p: Turn off autoindent while pasting.
nnoremap <silent> <leader>p :set invpaste paste?<CR>
set pastetoggle=<leader>p

" <F3> Toggle between tabs and spaces
noremap <F3> :set invexpandtab expandtab?<CR>

" <F5> Remove all trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Leader-[]: Move through tabs
nnoremap <silent> <leader>] :tabn<cr>
nnoremap <silent> <leader>[ :tabp<cr>

" CoC Plugin

" Use tab for auto-complete
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Only enable coc for certain filetypes
" let g:coc_filetypes_enable = [ 'typescriptreact', 'javascriptreact']

"function! s:disable_coc_for_type()
"  if index(g:coc_filetypes_enable, &filetype) == -1
"    :silent! CocDisable
"  else
"    :silent! CocEnable
"  endif
"endfunction
"
"augroup CocGroup
" autocmd!
" autocmd BufNew,BufEnter,BufAdd,BufCreate * call s:disable_coc_for_type()
"augroup end

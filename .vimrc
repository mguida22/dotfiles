" set comma as leader key for custom cmds
let mapleader = ","

" colors
syntax enable

" line numbers
set number

" show current line
set cursorline

" tabs
set tabstop=2
set expandtab
set smarttab
set autoindent
filetype indent on

" searching
set hlsearch
set incsearch
set smartcase

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" display matching brackets, etc..
set showmatch

" file stats
set ruler

" render fast
set ttyfast

" visual display of options for autocomplete
set wildmenu

" CtrlP settings
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
highlight CursorLineNr cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=LightGrey


" Enables the syntax of the language.
syntax on

" Display the number lines
set number
" Display the lines relative to the current line
set relativenumber

" Set the encoding to utf-8
set encoding=utf-8

" Disable compatibility
set nocompatible

" Enables the command history
set showcmd

" Indents the file according to the plugin
filetype plugin indent on

" Replace the sound bell to visual bell
set visualbell
" Makes the visual bell invisible
set t_vb=

" Disable wrapping
"set nowrap

" Set the tab to 4 spaces
set tabstop=4 
" Set the indentation to 4 spaces
set shiftwidth=4 smarttab
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Set a column delimiter to 80
"set cc=80
" Set the color of the column delimiter to gray
"hi ColorColumn ctermbg=238

set list
set listchars=tab:-->
hi SpecialKey ctermfg=DarkGray

" Highlight every search
set hlsearch
" Moves to the first occurrence
set incsearch
" Insensitive case search
set ignorecase
" Case sensitive when searching uppercase
set smartcase

" Autocomplete parenthesis
inoremap ( ()<Left>
" Autocomplete bracket
inoremap [ []<Left>
" Autocomplete curly bracket
inoremap { {}<Left>
" Highlight pairs with color red
hi MatchParen cterm=bold ctermbg=none ctermfg=yellow

" Enable plugin installation using vim-plug
call plug#begin('~/.vim/plugged')
	Plug 'wakatime/vim-wakatime'
	Plug 'rust-lang/rust.vim'
call plug#end()

let g:rustfmt_autosave = 1



if has('autocmd')
	autocmd BufReadPost * 
	\if line("'\"") > 1 && line("'\"") <= line("$") | 
	\	execute "normal! g`\"" | 
	\endif
endif


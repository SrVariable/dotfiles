synta on								" Enables the syntax of the language.
set number								" Display the number lines
set relativenumber						" Display the relative number lines
set encoding=utf-8						" Set the encoding to utf-8
set nocompatible						" Disable compatibility
set showcmd								" Enables the command history
filetype plugin indent on				" Indents the file according to the plugin
set cc=80								" Set the column to 80 characters
set nowrap								" Disable line wrap
set hlsearch							" Highlight the search
set incsearch							" Incremental search
set ignorecase							" Case insensitive when searching lowercase
set smartcase							" Case sensitive when searching uppercase
let g:rustfmt_autosave = 1				" Automatically format the rust code when saving
let g:copilot_enabled = 0				" Disable copilot
set termguicolors						" Enable 24-bit color
colorscheme srvariable					" Set the color scheme
set autoindent
set smartindent

" Remove bell
set visualbell
set t_vb=

" Set the tab to 4 spaces
set tabstop=4 
set shiftwidth=4 smarttab
set backspace=indent,eol,start

" Show invisible characters
set list
set listchars=tab:-->

" Enable plugin installation using vim-plug
call plug#begin('~/.vim/plugged')
	Plug 'wakatime/vim-wakatime'
	Plug 'rust-lang/rust.vim'
	Plug 'chrisbra/Colorizer'
call plug#end()

" Jump to the last position of the file
if has('autocmd')
	autocmd BufReadPost * 
	\if line("'\"") > 1 && line("'\"") <= line("$") | 
	\	execute "normal! g`\"" | 
	\endif
endif

" Custom keybindings
let mapleader=" "
noremap <F2> m1gg=G'1
nnoremap ; :
noremap <c-d> dd
nnoremap - u
nnoremap _ <c-r>
nnoremap 0 _
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap jk <esc>l
noremap J ddp
noremap K ddkP
nnoremap <leader>e :vsplit $MYVIMRC<cr>
nnoremap <leader>s :source $MYVIMRC<cr>

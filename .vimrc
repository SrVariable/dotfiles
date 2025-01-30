" @--------------------------------------------------------------------------@ "
" |                              Safe to copy                                | "
" @--------------------------------------------------------------------------@ "

syntax on								" Enables the syntax of the language.
set number								" Display the number lines
set relativenumber						" Display the relative number lines
set encoding=utf-8						" Set the encoding to utf-8
set nocompatible						" Disable compatibility
set showcmd								" Enables the command history
filetype plugin indent on				" Indents the file according to the plugin
set cc=0								" Set the column to 80 characters
set nowrap								" Disable line wrap
set hlsearch							" Highlight matching searches
set incsearch							" Incremental search
set ignorecase							" Case insensitive when searching lowercase
set smartcase							" Case sensitive when searching uppercase
let mapleader=" "						" Set leader key to Space
set termguicolors						" Enable 24-bit color
set tags=./tags;../tags;/;~/tags		" Set tags
set hidden								" Disable warning when switching between buffers
set noswapfile
set mouse=a
"set foldmarker={,}
set foldmarker=<<<<<<<,>>>>>>>
set foldmethod=marker
set nofoldenable

" Set paths to find files
set path+=~/docs
set path+=/usr/include
set path+=/usr/include/*
set path+=/usr/include/*/*
set path+=../*
set path+=../*/*
set path+=../*/*/*

" Remove annoying stuff
set visualbell
set t_vb=
hi Error NONE

" Set the tab to 4 spaces
set tabstop=4 
set shiftwidth=4 smarttab
set backspace=indent,eol,start

" Display tabs as -->
set list
set listchars=tab:»\ ,space:·

" Jump to the last position of the file
if has('autocmd')
	autocmd BufReadPost * 
		\if line("'\"") > 1 && line("'\"") <= line("$") | 
		\	execute "normal! g`\"" | 
		\endif
endif

" Custom keybindings
inoremap jk <esc><Right>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
nnoremap U <C-r>
nnoremap - /
nnoremap <C-c> <CMD>nohlsearch<CR>
nnoremap gr <C-]>
nnoremap gb <C-t>
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>d :bd!<CR>
nnoremap yf vf;y
nnoremap yp vf)y
nnoremap <leader>k 0<C-v>I//<esc>
nnoremap <leader>u <C-v>ld<esc>
vnoremap <leader>k 0<C-v>I//<esc>
vnoremap <leader>u <C-v>ld<esc>
vnoremap <leader>c !xclip -i -sel c<CR><CR>

" To jump to a header file (only works if there is a 42 header like)
nnoremap gl m1:13<CR>$hgf

" To enable numbers when looking at :help
autocmd FileType help setlocal number

" @--------------------------------------------------------------------------@ "
" |                             Unsafe to copy                               | "
" @--------------------------------------------------------------------------@ "
" NOTE: unsafe because it won't work right away after copying, some
" installation is needed to make it work

" Custom Headers
nnoremap <leader>h1 :Stdheader<CR>
nnoremap <leader>h2 :Hedgehog<CR>

" To install: https://github.com/srvariable/themedgehog
"colorscheme themedgehog

set background=dark
colorscheme themedgehog

" For comment sections
nnoremap <leader>hs :read !python3 ~/GitRepos/Scripts/Python/header_gen.py /\* 
nnoremap <leader>hh :read !python3 ~/GitRepos/Scripts/Python/header_gen.py \\# 
nnoremap <leader>hq :read !python3 ~/GitRepos/Scripts/Python/header_gen.py \" 

" Snippets
nnoremap <leader>-d :-1read ~/.vim/snippets/daily.vim<CR>6ji
nnoremap <leader>-m :-1read ~/.vim/snippets/c_main.vim<CR>Gddgg3jo
nnoremap <leader>-hg :-1read ~/.vim/snippets/cpp_header.vim<CR>:execute '%s/FOO/' . toupper(expand('%:t:r')) . '/g'<CR><CR>Gdd/class<CR>3j:put =expand('%:t:r')<CR>0iclass <esc>kddo{<esc>o};<esc>Opublic:<esc>:put =expand('%:t:r')<CR>i		<esc>$a();<esc>yyp0wi~<esc>:put =expand('%:t:r')<CR>$a<esc>:execute "normal! a" . "(const " . expand('%:t:r') . " &that);"<esc>V2>><esc>2o<esc>:execute "normal! a" . expand('%:t:r') . "	&operator=(const " . expand('%:t:r') . " &that);"<CR>V2>><esc>2o<esc>aprivate:<esc>:Stdheader<CR>:noh<CR>

" Enable plugin installation using vim-plug: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
	Plug 'wakatime/vim-wakatime'
call plug#end()

let g:rustfmt_autosave = 1
autocmd FileType c,cpp setlocal cc=80

let g:user42 = "ribana-b"
let g:mail42 = "ribana-b@student.42malaga.com"

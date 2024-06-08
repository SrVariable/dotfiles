syntax on								" Enables the syntax of the language.
set number								" Display the number lines
set relativenumber						" Display the relative number lines
set encoding=utf-8						" Set the encoding to utf-8
set nocompatible						" Disable compatibility
set showcmd								" Enables the command history
filetype plugin indent on				" Indents the file according to the plugin
set cc=80								" Set the column to 80 characters
set nowrap								" Disable line wrap
"set hlsearch							" Highlight matching searches
set incsearch							" Incremental search
set ignorecase							" Case insensitive when searching lowercase
set smartcase							" Case sensitive when searching uppercase
let g:rustfmt_autosave = 1				" Automatically format the rust code when saving
let g:copilot_enabled = 0				" Disable copilot
let mapleader=" "						" Set leader key to Space
set termguicolors						" Enable 24-bit color
colorscheme themedgehog					" Set the color scheme
set tags=./tags;../tags;/;~/tags		" Set tags
set hidden								" Disable warning when switching between buffers
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
set path+=~/ObsidianVault
set path+=~/ObsidianVault/*
set path+=~/ObsidianVault/*/*

" Remove bell
set visualbell
set t_vb=

" Set the tab to 4 spaces
set tabstop=4 
set shiftwidth=4 smarttab
set backspace=indent,eol,start

" Display tabs as -->
set list
set listchars=tab:-->

" Jump to the last position of the file
if has('autocmd')
	autocmd BufReadPost * 
		\if line("'\"") > 1 && line("'\"") <= line("$") | 
		\	execute "normal! g`\"" | 
		\endif
endif

" Custom keybindings
noremap <F2> m1gg=G'1
nnoremap U <C-r>
nnoremap - /
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap jk <esc><Right>
noremap j gj
noremap k gk
nnoremap <leader>j J
nnoremap <leader>s :w<CR>
nnoremap <leader>f :FZF ~<CR>
nnoremap <leader>te :NERDTreeToggle<CR>
nnoremap <leader>tf :NERDTreeFind<CR>
nnoremap gr <C-]>
nnoremap gb <C-t>
nnoremap <leader>1 :b1<CR>
nnoremap <leader>2 :b2<CR>
nnoremap <leader>3 :b3<CR>
nnoremap <leader>4 :b4<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>d :bd!<CR>
nnoremap <leader>hs :read !python3 ~/GitRepos/Scripts/Python/header_gen.py /\* 
nnoremap <leader>hh :read !python3 ~/GitRepos/Scripts/Python/header_gen.py \\# 
nnoremap <leader>hq :read !python3 ~/GitRepos/Scripts/Python/header_gen.py \" 
nnoremap <leader>mr :make run ARGS=""<Left>
nnoremap gl m1:13<CR>$hgf
nnoremap K :execute 'vert Man' . 'expand('<cword>')'<CR>
nnoremap yf vf;y
nnoremap '1 '1zz

" Snippets
" TODO

" Enable plugin installation using vim-plug
call plug#begin('~/.vim/plugged')
	Plug 'wakatime/vim-wakatime'
	Plug 'rust-lang/rust.vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'preservim/nerdtree'
call plug#end()

runtime! ftplugin/man.vim

command! -nargs=1 VMan vsplit | edit /tmp/doc | execute 'silent r! man <args>' | set filetype=man
nnoremap <leader>M :VMan 

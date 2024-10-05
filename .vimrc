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
set cc=80								" Set the column to 80 characters
set nowrap								" Disable line wrap
"set hlsearch							" Highlight matching searches
set incsearch							" Incremental search
set ignorecase							" Case insensitive when searching lowercase
set smartcase							" Case sensitive when searching uppercase
let mapleader=" "						" Set leader key to Space
set termguicolors						" Enable 24-bit color
set tags=./tags;../tags;/;~/tags		" Set tags
set hidden								" Disable warning when switching between buffers
set noswapfile
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

" Remove annoying stuff
set visualbell
set t_vb=
hi Error NONE

" Set the tab to 4 spaces
set tabstop=4 
set shiftwidth=4 smarttab
set backspace=indent,eol,start

" Display tabs as -->
set nolist
set listchars=tab:-->

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
noremap <F2> m1gg=G'1
nnoremap U <C-r>
nnoremap - /
noremap j gj
noremap k gk
nnoremap <leader>f :FZF ~<CR>
nnoremap gr <C-]>
nnoremap gb <C-t>
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>d :bd!<CR>
nnoremap <leader>mr :make run ARGS="\"\""<Left><Left><Left>
nnoremap yf vf;y
nnoremap yp vf)y
vnoremap <leader>k 0<C-v>I//<esc>
vnoremap <leader>u <C-v>ld<esc>
noremap <F9> <esc>:make run ARGS=""<Left>

" To jump to a header file (only works if there is a header)
nnoremap gl m1:13<CR>$hgf

" To enable :Man
"runtime! ftplugin/man.vim
"nnoremap K :execute 'vert Man' . 'expand('<cword>')'<CR>
"command! -nargs=1 VMan vsplit | edit /tmp/doc | execute 'silent r! man <args>' | set filetype=man
"nnoremap <leader>vm :VMan 

" @--------------------------------------------------------------------------@ "
" |                             Unsafe to copy                               | "
" @--------------------------------------------------------------------------@ "
" NOTE: unsafe because it won't work right away after copying, some
" installation to make it work

" Custom Headers
nnoremap <leader>h1 :Stdheader<CR>
nnoremap <leader>h2 :Hedgehog<CR>

" To install: https://github.com/srvariable/themedgehog
colorscheme atlas

" For comment sections
nnoremap <leader>hs :read !python3 ~/GitRepos/Scripts/Python/header_gen.py /\* 
nnoremap <leader>hh :read !python3 ~/GitRepos/Scripts/Python/header_gen.py \\# 
nnoremap <leader>hq :read !python3 ~/GitRepos/Scripts/Python/header_gen.py \" 

" Snippets
nnoremap <leader>-d :-1read ~/.vim/snippets/daily.vim<CR>6ji
nnoremap <leader>-m :-1read ~/.vim/snippets/c_main.vim<CR>Gddgg3jo
nnoremap <leader>-hg :-1read ~/.vim/snippets/cpp_header.vim<CR>:execute '%s/FOO/' . toupper(expand('%:t:r')) . '/g'<CR><CR>Gdd/class<CR>3j:put =expand('%:t:r')<CR>0iclass <esc>kddo{<esc>o};<esc>Opublic:<esc>:put =expand('%:t:r')<CR>i		<esc>$a();<esc>yyp0wi~<esc>:put =expand('%:t:r')<CR>$a<esc>:execute "normal! a" . "(const " . expand('%:t:r') . " &that);"<esc>V2>><esc>2o<esc>:execute "normal! a" . expand('%:t:r') . "	&operator=(const " . expand('%:t:r') . " &that);"<CR>V2>><esc>2o<esc>aprivate:<esc>:Stdheader<CR>

" Enable plugin installation using vim-plug
call plug#begin('~/.vim/plugged')
	Plug 'wakatime/vim-wakatime'
	Plug 'rust-lang/rust.vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	"Plug 'vim-syntastic/syntastic'
	"Plug 'alexandregv/norminette-vim'
	"Plug 'jreybert/vimagit'
call plug#end()

"let g:rustfmt_autosave = 1				" Automatically format the rust code when saving
"let g:copilot_enabled = 0				" Disable copilot
"let g:syntastic_c_checkers = ['gcc']
"let g:syntastic_c_checkers = ['norminette', 'gcc']
"let g:syntantic_compiler = 'gcc'
"let g:syntastic_c_compiler_options = '-I ../include/BFL/include -I ./BFL/include -I ../include/BFL/include'
"let g:syntastic_cpp_compiler_options = '-I ./include/BFL/include -I ./BFL/include -I ../include/BFL/include'
"let g:syntastic_c_compiler_options = '-Wall -Wextra -Werror -I../include/BFL/include -I./BFL/include'
"let g:syntastic_aggregate_errors = 1

syntax on								" Enables the syntax of the language.
set number								" Display the number lines
set relativenumber						" Display the relative number lines
set encoding=utf-8						" Set the encoding to utf-8
set nocompatible						" Disable compatibility
set showcmd								" Enables the command history
filetype plugin indent on				" Indents the file according to the plugin
set cc=80								" Set the column to 80 characters
set nowrap								" Disable line wrap
set hlsearch							" Highlight matching searches
set incsearch							" Incremental search
set ignorecase							" Case insensitive when searching lowercase
set smartcase							" Case sensitive when searching uppercase
let g:rustfmt_autosave = 1				" Automatically format the rust code when saving
let g:copilot_enabled = 0				" Disable copilot
let mapleader=" "						" Set leader key to Space
set termguicolors						" Enable 24-bit color
colorscheme themedgehog					" Set the color scheme

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

function! MoveLineUp()
    if line('.') == line('$') && line('.') != 1
        normal! ddP
    else
        normal! ddkP
    endif
endfunction

" Custom keybindings
noremap <F2> m1gg=G'1
nnoremap , :
nnoremap U <C-r>
nnoremap - /
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap jk <esc><Right>
noremap j gj
noremap k gk
noremap J ddp
noremap B bbe
noremap K :call MoveLineUp()<CR>
nnoremap <leader>j J
nnoremap <leader>s :w<CR>
nnoremap <leader>f :FZF ~<CR>
nnoremap <leader>te :NERDTreeToggle<CR>
nnoremap <leader>tf :NERDTreeFind<CR>

" Snippets
" TODO

" Enable plugin installation using vim-plug
call plug#begin('~/.vim/plugged')
	Plug 'wakatime/vim-wakatime'
	Plug 'rust-lang/rust.vim'
	Plug 'chrisbra/Colorizer'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'preservim/nerdtree'
call plug#end()

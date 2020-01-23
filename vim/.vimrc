" vim option
let mapleader=","
syntax on
set number
set relativenumber
set ignorecase

" Indentation
set tabstop=4
set autoindent
set smartindent
set softtabstop=4
set shiftwidth=4
set expandtab
autocmd Filetype make setlocal noexpandtab
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h15

" vim buffer/tab
nmap <leader>h :bprevious<cr>
nmap <leader>i :bnext<cr>

set t_Co=256
colors zenburn

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/vundle.vim'

" statusbar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" autocomplete & linter
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'zchee/deoplete-jedi'

Plugin 'dense-analysis/ale'

" ETC.
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
call vundle#end()
filetype plugin indent on    " required

" Deoplete
let g:deoplete#enable_at_startup = 1

let g:auto_complete_delay = 200
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
let g:deoplete#sources#jedi#python_path='/usr/bin/python3'

" ALE
let g:ale_completion_enabled = 0

let g:ale_set_highlights=1
let g:ale_set_signs=1

let g:ale_sign_column_always=1

let g:ale_cursor_detail=1
let g:ale_close_preview_on_insert=1
let g:ale_echo_delay=100

let g:ale_linters={'cpp': ['clangtidy', 'cppcheck', 'gcc'], 'python': ['flake8']}
let g:ale_fixers = {
            \'*': ['remove_trailing_lines', 'trim_whitespace'],
            \'python': ['black', 'isort'],
            \}

let g:ale_cpp_clangtidy_checks=['modernize-*', 'cppcoreguidelines-*', 'performance-*', 'portability-*', 'bugprone-*', 'cert-*']
let g:ale_cpp_clangtidy_header_suffixes=['h', 'hpp', 'hxx', 'tcc']

let g:ale_cpp_clangtidy_options = '-Wall -std=c++17 -xc++'
let g:ale_cpp_cppcheck_options = '-Wall -std=c++17 -xc++'
let g:ale_cpp_gcc_options = '-Wall -std=c++17 -xc++'

nmap <silent> <C-j> :ALENext<cr>
nmap <silent> <C-k> :ALEPrevious<cr>

" NerdTree
map <F3> :NERDTreeToggle<CR>

autocmd BufEnter * lcd %:p:h
autocmd VimEnter * if !argc() | NERDTree | endif

let NERDTreeShowLineNumbers=1
let g:NERDTreeWinPos = "right"

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" CtrlP
let g:ctrlp_workig_path_mode='r'

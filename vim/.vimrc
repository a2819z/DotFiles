" vim option
let mapleader = ","
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

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" statusbar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" File System
Plugin 'scrooloose/nerdtree'    "File Tree
Plugin 'ctrlpvim/ctrlp.vim'     "File search
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" C++
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Valloric/YouCompleteMe'
Plugin 'w0rp/ale'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'majutsushi/tagbar'

" Python
Plugin 'plytophogy/vim-virtualenv'

" Etc.
Plugin 'kana/vim-operator-user'
Plugin 'rhysd/vim-clang-format'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Yggdroot/indentLine'

call vundle#end()            " required
filetype plugin indent on    " required

" Key Mapping F1 ~ F12
map <F2> :bn<CR>
map <F3> <ESC>:NERDTreeToggle<CR>
map <F4> :TagbarToggle<CR>
map <F6> :YcmCompleter GoTo<CR>


" vim-airline
let g:airline_powerline_fonts =1
let g:airline#extensions#tabline#enabled =1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_detect_modified=1
let g:airline_skip_empty_sections=1
let g:airline#extensions#ycm#enabled=0
let g:airline#extensions#ale#enabled=1

" cpp-enhanced-highlight option
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight =1

" snipset
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" YouCompleteMe
" libclang based
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_key_list_select_comletion=['<tab>']
let g:ycm_key_list_previous_completion=['<s-tab>']
let g:ycm_show_diagnostics_ui = 0

" clangd based
let g:ycm_clangd_uses_ycmd_caching=0
let g:ycm_clnagd_binary_path=exepath("clangd")

" ale
let g:ale_set_highlights=1
let g:ale_set_signs=1

let g:ale_sign_column_always=1

let g:ale_cursor_detail=1
let g:ale_close_preview_on_insert=1
let g:ale_echo_delay=100

let g:ale_linters={'cpp': ['clangtidy', 'cppcheck', 'gcc']}
let g:ale_completion_enabled=0

let g:ale_cpp_clangtidy_checks=['modernize-*', 'cppcoreguidelines-*', 'performance-*', 'portability-*', 'bugprone-*', 'cert-*']
let g:ale_cpp_clangtidy_header_suffixes=['h', 'hpp', 'hxx', 'tcc']

let g:ale_cpp_clangtidy_options = '-Wall -std=c++17 -xc++'
let g:ale_cpp_cppcheck_options = '-Wall -std=c++17 -xc++'
let g:ale_cpp_gcc_options = '-Wall -std=c++17 -xc++'

nmap <silent> <C-j> :ALENext<cr>
nmap <silent> <C-k> :ALEPrevious<cr>

" CtrlP
let g:ctrlp_workig_path_mode='r'

" delimiMate
let delimMate_expand_cr=1

" vim-multiple-cursor
let g:multi_cursor_use_default_mapping=0

" mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" NERDTree
autocmd BufEnter * lcd %:p:h
autocmd VimEnter * if !argc() | NERDTree | endif

let NERDTreeShowLineNumbers=1
let g:NERDTreeWinPos = "right"

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

"   call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
"   call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
"   call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')

" clang-format
map <F5> :pyf /usr/share/clang/clang-format.py<cr>
imap <F5> <c-o>:pyf /usr/share/clang/clang-format.py<cr>

" tagbar
let g:tagbar_left=1

" NERD Commenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" indentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" vim:foldmethod=marker:foldlevel=0
" vim-option {{{
set number
set relativenumber
set ignorecase

colors zenburn
" }}} vim-option

" vim-plug {{{
call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'terryma/vim-multiple-cursors'
Plug 'preservim/nerdcommenter'

call plug#end()
" }}} vim-plug

" Spaces & Tabs {{{
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set copyindent
" }}} Spaces & Tabs

" coc settings {{{
set nobackup
set nowritebackup

set cmdheight=2

set updatetime=300

set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <F2> <Plug>(coc-rename)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" }}} coc setings
" ale {{{
let g:ale_completion_enabled = 0

let g:ale_set_highlights=1
let g:ale_set_signs=1

let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

let g:ale_sign_column_always=1

let g:ale_cursor_detail=0
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

" }}} ale
" nertree {{{
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

" }}} nerdtree
" ultisnips {{{
let g:UltiSnipsExpandTrigger = "<C-e>"
let g:UltiSnipsJumpForwardTrigger = "<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-h>"
" }}} ultisnips
" nerdcommenter {{{
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = {'python': {'left': '#'}}
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
" }}} nerdcommenter
" airline {{{
let g:airline_powerline_fonts =1
let g:airline#extensions#tabline#enabled =1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_detect_modified=1
let g:airline_skip_empty_sections=1
let g:airline#extensions#ale#enabled=1
" }}} airline

call plug#begin('~/.vim/plugged')

Plug 'tomasiser/vim-code-dark'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'chriskempson/base16-vim'
" Plug 'terryma/vim-multiple-cursors'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tomasr/molokai'

call plug#end()

set number
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set belloff=all
set noswapfile
set scrolloff=5
set autoindent
set paste
set cursorline
set termguicolors
set nocompatible
set updatetime=300
syntax on
filetype plugin indent on

colorscheme molokai

inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

inoremap <expr> <bs> <sid>remove_pair()
imap <c-h> <bs>

function s:remove_pair() abort
	let pair = getline('.')[ col('.')-2 : col('.')-1 ]
	return stridx('""''''()[]<>{}', pair) % 2 == 0 ? "\<del>\<c-h>" : "\<bs>"
endfunction

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()
command! -bang -nargs=* SearchInProject
  \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'dir': system('git -C '.expand('%:p:h').' rev-parse --show-toplevel 2> /dev/null')[:-2]}, <bang>0)

inoremap " ""<c-g>U<left>
map <C-n> :NERDTreeToggle<CR>
map <C-p> :ProjectFiles<CR>
map <C-f> :SearchInProject<CR>
highlight link LspErrorText GruvboxRedSign " requires gruvbox
highlight clear LspWarningLine
let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

let g:lsp_highlight_references_enabled = 1
let g:markdown_fenced_languages = [
			\ 'vim',
			\ 'help'
			\]
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }
let g:molokai_original = 1
let g:rehash256 = 1
let g:gitgutter_highlight_lines = 1
let g:gitgutter_async=0
au FileType cpp setlocal formatexpr= formatprg=clang-format\ -style=file

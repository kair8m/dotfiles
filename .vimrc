call plug#begin('~/.vim/plugged')

Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'chriskempson/base16-vim'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'folke/lsp-colors.nvim'
" Plug 'mattn/vim-lsp-settings'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tomasr/molokai'
" Plug 'Valloric/YouCompleteMe'
Plug 'rakr/vim-one'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

call plug#end()

set nobackup
set nowritebackup
set number
set signcolumn=yes
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
set smartindent
set nowrap
set is hls
set clipboard=unnamedplus
set mouse=a
set title
syntax on
filetype indent on
filetype plugin indent on

colorscheme dracula

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
command! NerdTreeProjectRoot execute 'NERDTreeToggle' s:find_git_root()

inoremap " ""<c-g>U<left>
map <C-n> :NerdTreeProjectRoot<CR>
map <C-p> :ProjectFiles<CR>
map <C-f> :SearchInProject<CR>
map <esc> :noh <CR>
" highlight link LspErrorText GruvboxRedSign " requires gruvbox
" highlight clear LspWarningLine
" hi LspDiagnosticsVirtualTextError guifg=Red ctermfg=LightRed
" let g:lsp_signs_enabled = 1         " enable signs
" let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
" let g:lsp_highlight_references_enabled = 1

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

packadd termdebug
syntax enable

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
let g:termdebug_popup = 0
let g:termdebug_wide = 163
" Use homebrew's clangd
let g:ycm_clangd_binary_path = '/usr/lib/clang'
let g:ycm_max_diagnostics_to_display = 1000


inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

let g:coc_fzf_preview_fullscreen=1

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" highlight LspDiagnosticsDefaultError guifg=#FF0000
au FileType cpp setlocal formatexpr= formatprg=clang-format\ -style=file
au FileType python setlocal formatprg=autopep8\ -

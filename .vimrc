call plug#begin('~/.config/nvim/plugged')

Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'chriskempson/base16-vim'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'ryanoasis/vim-devicons'

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
set smartindent
set cursorline
set termguicolors
set nocompatible
set updatetime=300
set nowrap
set is hls
set clipboard=unnamedplus
set mouse=a
set title
syntax on
filetype indent on
filetype plugin indent on

colorscheme dracula

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()
command! -bang -nargs=* SearchInProject
  \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'dir': system('git -C '.expand('%:p:h').' rev-parse --show-toplevel 2> /dev/null')[:-2]}, <bang>0)
command! NerdTreeProjectRoot execute 'NERDTreeToggle' s:find_git_root()

map <C-n> :NerdTreeProjectRoot<CR>
map <C-p> :ProjectFiles<CR>
map <C-f> :SearchInProject<CR>
map <esc> :noh <CR>

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

let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }
let g:rehash256 = 1
" let g:gitgutter_highlight_lines = 1
let g:gitgutter_async=0
let g:termdebug_popup = 0
let g:termdebug_wide = 163

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy :<C-u>CocCommand fzf-preview.CocDefinitions<CR>
nmap <silent> gi :<C-u>CocCommand fzf-preview.CocImplementation<CR>
nmap <silent> gr :<C-u>CocCommand fzf-preview.CocReferences<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []
let g:coc_default_semantic_highlight_groups = 1
let g:lsp_cxx_hl_use_text_props = 1

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <C-r> <Plug>(coc-refactor)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" highlight LspDiagnosticsDefaultError guifg=#FF0000
au FileType cpp setlocal formatexpr= formatprg=clang-format\ -style=file
au FileType python setlocal formatprg=autopep8\ -

nnoremap <silent> <A-Right> <Cmd>BufferNext<CR>
nnoremap <silent> <A-Left> <Cmd>BufferPrevious<CR>
nnoremap <silent> <A-c> <Cmd>BufferClose<CR>

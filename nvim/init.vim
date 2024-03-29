" Options
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set inccommand=split
set mouse=a
set number " Shows the current line number
" set relativenumber

autocmd FileType * set formatoptions-=cro " Disables new line comment for all files

set autoindent
set smartindent

 " Scroll up half a page and center cursor
nnoremap <C-u> <C-u>zz
 " Scroll down half a page and center cursor
nnoremap <C-d> <C-d>zz

set nowrap

" Set color
set t_Co=256

" Tabs size
set shiftwidth=4
set tabstop=4


call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'preservim/nerdtree' |
            \ Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'projekt0n/github-nvim-theme'
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'arzg/vim-colors-xcode'
Plug 'numToStr/Comment.nvim'
Plug 'tomasiser/vim-code-dark'
Plug 'sainnhe/sonokai'

call plug#end()

" comment plugin
lua require('Comment').setup()


set numberwidth=4
" Make line numbers white
autocmd ColorScheme * hi LineNrAbove ctermfg=229
autocmd ColorScheme * hi LineNrBelow ctermfg=229

" Theme
" colorscheme github_dark
" colorscheme codedark
" colorscheme gruvbox
" colorscheme tender
" colorscheme xcodedark
colorscheme xcodedarkhc
" colorscheme xcodelight
" colorscheme xcodelighthc
" colorscheme sonokai

" Airline theme
" let g:airline_theme="sonokai"

" Github Copilot Config
let g:copilot_node_command = "~/.nvm/versions/node/v16.15.0/bin/node" " Load Copilot with v16.50.0
" Disables specified filetypes
let g:copilot_disabled_filetypes = ['markdown', 'xml']

" >>>>>>>>>>>>>>>>>>>>>>>>> NERDTree
:let g:NERDTreeWinSize = 45
" Toggles NERDTree sidebar
nnoremap <C-t> :NERDTreeToggle<CR>
" Toggles find mode
nnoremap <C-f> :NerdTreeFind<CR>
" Focuses onto sidebar
nnoremap <C-n> :NERDTreeFocus<CR>

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="-"

" >>>>>>>>>>>>>>>>>>>> COC 
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

" coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)



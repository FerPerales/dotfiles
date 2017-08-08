call plug#begin('~/.vim/plugged')
" Git plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-gitgutter'

" Search files
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'jlanzarotta/bufexplorer'

" Comments
Plug 'scrooloose/nerdcommenter'

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'antlypls/vim-colors-codeschool'
Plug 'justincampbell/vim-railscasts'
Plug 'mkarmona/materialbox'
Plug 'vim-scripts/moria'

Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-abolish'

Plug 'chrisbra/NrrwRgn'
Plug 'wesQ3/vim-windowswap'

let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsSnippetsDir=$HOME.'/.vim/ultisnippets/'
let g:UltiSnipsSnippetDirectories=["ultisnippets/"]


" Ruby
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

" Go
Plug 'fatih/vim-go'

" Markdown
Plug 'suan/vim-instant-markdown'

" Typescript
"
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/vim-js-pretty-template'

" Javascript
"
Plug 'dai-shi/es-beautifier', {'rtp': 'contrib/vim', 'external_commands': 'node', 'build_commands': 'npm', 'build': {'others': 'npm install --only=production'}}


" Others
Plug 'vim-airline/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
"Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'raimondi/delimitmate'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sheerun/vim-polyglot'
Plug 'othree/html5.vim'
Plug 'scrooloose/syntastic'
Plug 'elzr/vim-json'
Plug 'xuyuanp/nerdtree-git-plugin'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'kchmck/vim-coffee-script'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/AdvancedSorters'
Plug 'chiedo/vim-sort-blocks-by'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'lilydjwg/colorizer'
Plug 'editorconfig/editorconfig-vim'

call plug#end()

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

set updatetime=250
set relativenumber
set number

syntax enable
set background=dark
colorscheme railscasts
let g:solarized_termcolors=256

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWritePre * :%s/\s\+$//e

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set cursorline      " highlight current line
filetype indent on
set wildmenu
set lazyredraw
set showmatch
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

"Changes for syntactic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 expandtab
autocmd Filetype sass setlocal ts=2 sw=2 expandtab shiftwidth=2 tabstop=2
autocmd Filetype scss setlocal ts=2 sw=2 expandtab shiftwidth=2 tabstop=2
autocmd Filetype js setlocal ts=2 sw=2 sts=0 expandtab shiftwidth=2 tabstop=2
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab shiftwidth=2 tabstop=2
autocmd Filetype typescript setlocal ts=2 sw=2 sts=0 expandtab shiftwidth=2 tabstop=2
autocmd Filetype jsx setlocal ts=2 sw=2 sts=0 expandtab shiftwidth=2 tabstop=2
autocmd Filetype ts setlocal ts=2 sw=2 sts=0 expandtab shiftwidth=2 tabstop=2

" Add current file name at the bottom of the status line
let g:airline#extensions#tabline#fnamemod = ':t'

" Convert HTML to HAML
nmap <leader>h :%!html2haml --erb 2> /dev/null<CR>:set ft=haml<CR>
vmap <leader>h :!html2haml --erb 2> /dev/null<CR>

let g:solarized_bold = 1
let g:solarized_underline = 1
let g:solarized_italic = 1
let g:solarized_contrast = "high"
let g:solarized_visibility= "high"

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Enable tagbar

nmap <F8> :TagbarToggle<CR>

let g:NERDTreeUpdateOnWrite = 1


" Typescript-related tunning

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

" ES-Beutifier
"
autocmd FileType javascript nnoremap <buffer> <Leader>e :call EsBeautifier()<cr>
autocmd FileType javascript vnoremap <buffer> <Leader>e :call RangeEsBeautifier()<cr>

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes = ['scss']

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
set colorcolumn=100

set clipboard=unnamedplus

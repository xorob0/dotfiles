""" Gener
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Cursor line in different color
set cursorline

"" Tabs. May be overriten by autocmd rules
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
"
"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Encoding
set bomb
set binary

"" Directories for swp files
set nobackup
" set noswapfile

" Save undo trees
set undofile

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/sh

"" Cool compltetion
set wildmode=longest,list,full
set wildmenu

" Session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "yes"
let g:session_autosave = "yes"
let g:session_command_aliases = 1

" Python support
let g:python_host_prog='/usr/bin/python3.7'

" Set map leader
let mapleader = ","
let g:mapleader = ","

"" Center search completion
nnoremap n nzz
nnoremap N Nzz

""" Visual
syntax on
set ruler
set number
set relativenumber

let no_buffers_menu=1

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

""" Plugins
if &compatible
	set nocompatible
endif

set runtimepath+=/home/toum/.config/nvim/repos/github.com/Shougo/dein.vim

call plug#begin('~/.vim/plugged')

	" NerdTREE
	Plug 'scrooloose/nerdtree'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'ryanoasis/vim-devicons'

	" Completion Framework
	Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
	" Completion Extentions
	Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-sources', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-emmet', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
	Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}

	" " Snippets
	Plug 'honza/vim-snippets'

	" Linter
	Plug 'w0rp/ale'

	" Change date with <C-A> and <C-X>
	Plug 'tpope/vim-speeddating'

	" Comment with <gcc>
	Plug 'tpope/vim-commentary'

	" Enable multiple curors with <C-n>
	Plug 'terryma/vim-multiple-cursors'

	" Code formating (see the github page for the compatible formatters)
	Plug 'sbdchd/neoformat'

	" Add git status
	Plug 'mhinz/vim-signify'

	" Git wrapper for vim
	Plug 'tpope/vim-fugitive'
	Plug 'rbong/vim-flog'

	" Syntax colorization for almost all languages
	Plug 'sheerun/vim-polyglot'

	" Automatic opening and closing of parentheses
	Plug 'Raimondi/delimitMate'

	" Add functions like Delete, Move, SudoWrite,...
	Plug 'tpope/vim-eunuch'

	" Surround with cs"'
	Plug 'tpope/vim-surround'
	" " Better pairs tricks
	" Plug 'wellle/targets.vim'

	" See undo tree with F5
	Plug 'mbbill/undotree'

	" Colorize parentheses
	Plug 'luochen1990/rainbow'

	" Magnificent theme
	Plug 'arcticicestudio/nord-vim'

	" Show indent level
	Plug 'nathanaelkane/vim-indent-guides'

	Plug 'vim-airline/vim-airline'

	" Translations in vim buffer
	" Plug 'soywod/vim-translate'
	
	" Pretty code
	Plug 'prettier/vim-prettier'

	" Tagbar
	Plug 'majutsushi/tagbar'

	" Flow checking code
	Plug 'flowtype/vim-flow'

	" " Coloring CSS files
	" Plug 'ap/vim-css-color'

	" Fuzzy file finder
	Plug 'junegunn/fzf'
	" Fuzzy word finder
	Plug 'mileszs/ack.vim'

	" " abbreviation for html
	" Plug 'mattn/emmet-vim'

	" Markdown preview
	Plug 'iamcco/markdown-preview.nvim'

	" JS auto import
	Plug 'Galooshi/vim-import-js'

	" See git commit under the cursor with <leader>gm
	Plug 'rhysd/git-messenger.vim'

call plug#end()

""" Addons configuration
"" Autocompletion
" Use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" Use Tab and S-Tab to navigate in completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use Enter to complete
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use Enter to auto select first if no other selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" Use Enter to select snippets
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use Tab to move around inside the snippet
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'


" Enable completion where available.
" This setting must be set before ALE is loaded.
let g:ale_completion_enabled = 1

" " only have emmet on html and css files
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall
" " Using custom shortcut for emmet
" " let g:user_emmet_expandabbr_key='<C-S-Tab>'
" imap <expr> <s-tab> emmet#expandAbbrIntelligent("\<s-tab>")

"" Neoformat
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" Auto prettify js
autocmd BufWritePre *.js Neoformat
autocmd BufWritePre *.ts Neoformat

"" Flow
" Don't show quickfix
let g:flow#showquickfix = 0

""DelimitMate
" Visual Studio like braces
let b:delimitMate_expand_space = 1
let b:delimitMate_expand_cr = 1

"" Javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-Add)
imap <F4> <Plug>(JavaComplete-Imports-Add)
nmap <F5> <Plug>(JavaComplete-Imports-AddMissing)
imap <F5> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F6> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F6> <Plug>(JavaComplete-Imports-RemoveUnused)

"" NerdTREE
" User NerdTREE on directories
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Close vim if only window left is nerdTREE
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Disable display of '?' text and 'Bookmarks' label.
let g:NERDTreeMinimalUI=1
" Opening NERDTree with SHift-Enter
noremap <S-CR> :NERDTreeFocus<CR>
noremap <C-S-CR> :NERDTreeFocus<CR>


"" Visual Studio like braces
let b:delimitMate_expand_space = 1
let b:delimitMate_expand_cr = 1

" See undo tree with F5
nnoremap <F5> :UndotreeToggle<cr>

"" Activate rainbow parentheses
let g:rainbow_active = 1

"" Activate GitGutter
let g:gitgutter_realtime = 1

"" Activate Vim airline
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
	let g:airline#extensions#tabline#left_sep = ' '
	let g:airline#extensions#tabline#left_alt_sep = '|'
	let g:airline_left_sep          = ''
	let g:airline_left_alt_sep      = '»'
	let g:airline_right_sep         = ''
	let g:airline_right_alt_sep     = '«'
	let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
	let g:airline#extensions#readonly#symbol   = '⊘'
	let g:airline#extensions#linecolumn#prefix = '¶'
	let g:airline#extensions#paste#symbol      = 'ρ'
	let g:airline_symbols.linenr    = '␊'
	let g:airline_symbols.branch    = '⎇'
	let g:airline_symbols.paste     = 'ρ'
	let g:airline_symbols.paste     = 'Þ'
	let g:airline_symbols.paste     = '∥'
	let g:airline_symbols.whitespace = 'Ξ'
else
	let g:airline#extensions#tabline#left_sep = ''
	let g:airline#extensions#tabline#left_alt_sep = ''

	" powerline symbols
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_symbols.branch = ''
	let g:airline_symbols.readonly = ''
	let g:airline_symbols.linenr = ''
endif

"" Theme
if !exists('g:not_finish_vimplug')
	" Enable italic
	let g:nord_italic = 1
	let g:nord_italic_comments = 1
	" Uniform status lines
	let g:nord_uniform_status_lines = 1
	" Comment brightness
	" set termguicolors
	let g:nord_comment_brightness = 12

	" Activation
	colorscheme nord
endif
hi Normal guibg=NONE ctermbg=NONE

"" Translation
let g:trans_default_source = "fr"
let g:trans_default_target = "en"

"" Indent Guide
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=NONE
hi IndentGuidesEven ctermbg=0

" set to 1, the nvim will open the preview window once enter the markdown buffer
" default: 0
let g:mkdp_auto_start = 1

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will just refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it just can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server only listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle'
    \ }

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

""" Mapping
"" Window switching with leader
" map <leader>h :wincmd h<CR>
" map <leader>j :wincmd j<CR>
" map <leader>k :wincmd k<CR>
" map <leader>l :wincmd l<CR>

"" JS auto import
map <leader>f :ImportJSFix<CR>
map <leader>w :ImportJSWord<CR>
map <leader>g :ImportJSGoto<CR>

"" Easy buffer switching
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>  

"" Easier Diff
map <leader>r :diffg RE<CR>
map <leader>o :diffg LO<CR>
map <leader>b :diffg BA<CR>

"" Copy/Paste/Cut
if has('unnamedplus')
	set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

"" New Java class template
autocmd BufNewFile *.java
			\ exe "normal Opublic class " . expand('%:t:r') . " {\<Delete>\<Esc>o\<Esc>o}\<Esc>2Gi\<Tab>"

"" Folds
" Using Shift-Tab to open and close folds
" nnoremap <s-tab> za
" not as cool as syntax, but faster
set foldmethod=indent               
" start unfolded
set foldlevelstart=99               

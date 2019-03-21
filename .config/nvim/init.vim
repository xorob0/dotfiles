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

if dein#load_state('/home/toum/.config/nvim/')
	call dein#begin('/home/toum/.config/nvim/')

	" Let dein manage dein
	" Required:
	call dein#add('/home/toum/.config/nvim//repos/github.com/Shougo/dein.vim')

	" Addons
	" " Fuzzy finder
	" call dein#add('Shougo/denite.nvim')

	" NerdTREE
	call dein#add('scrooloose/nerdtree')
	call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
	call dein#add('ryanoasis/vim-devicons')


	" Linting
	"call dein#add('w0rp/ale')

	" Completion Framework
	call dein#add('ncm2/ncm2')
	call dein#add('roxma/nvim-yarp')
	call dein#add('ncm2/ncm2-bufword')
	call dein#add('ncm2/ncm2-path')

	call dein#add('ncm2/ncm2-tern')

	" Snippets
	call dein#add('ncm2/ncm2-ultisnips')
	call dein#add('SirVer/ultisnips')
	call dein#add('honza/vim-snippets')
	call dein#add('epilande/vim-react-snippets')
	call dein#add('epilande/vim-es2015-snippets')

	" Linter
	call dein#add('w0rp/ale')

	" Change date with <C-A> and <C-X>
	call dein#add('tpope/vim-speeddating')

	" Comment with <gcc>
	call dein#add('tpope/vim-commentary')

	" Enable multiple curors with <C-n>
	call dein#add('terryma/vim-multiple-cursors')

	" Code formating (see the github page for the compatible formatters)
	call dein#add('sbdchd/neoformat')

	" Add git status
	call dein#add('mhinz/vim-signify')

	" Git wrapper for vim
	call dein#add('tpope/vim-fugitive')
	call dein#add('rbong/vim-flog')

	" Syntax colorization for almost all languages
	call dein#add('sheerun/vim-polyglot')

	" Automatic opening and closing of parentheses
	call dein#add('Raimondi/delimitMate')

	" Add functions like Delete, Move, SudoWrite,...
	call dein#add('tpope/vim-eunuch')

	" Surround with cs"'
	call dein#add('tpope/vim-surround')
	" Better pairs tricks
	call dein#add('wellle/targets.vim')

	" See undo tree with F5
	call dein#add('mbbill/undotree')

	" Colorize parentheses
	call dein#add('luochen1990/rainbow')

	" Magnificent theme
	call dein#add('arcticicestudio/nord-vim')

	" Show indent level
	call dein#add('nathanaelkane/vim-indent-guides')

	call dein#add('vim-airline/vim-airline')

	" Translations in vim buffer
	" call dein#add('soywod/vim-translate')
	
	" Pretty code
	call dein#add('prettier/vim-prettier')

	" Tagbar
	call dein#add('majutsushi/tagbar')

	" Flow checking code
	call dein#add('flowtype/vim-flow')

	" Coloring CSS files
	call dein#add('ap/vim-css-color')

	" Fuzzy file finder
	call dein#add('junegunn/fzf')
	" Fuzzy word finder
	call dein#add('mileszs/ack.vim')

	" abbreviation for html
	call dein#add('mattn/emmet-vim')

	" Markdown preview
	call dein#add('iamcco/markdown-preview.nvim')

	" JS auto import
	call dein#add('Galooshi/vim-import-js')

	" Required:
	call dein#end()
	call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

if dein#check_install()
	call dein#install()
endif

""" Addons configuration
"" Autocompletion
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-enter>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Enable completion where available.
" This setting must be set before ALE is loaded.
let g:ale_completion_enabled = 1

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" Tab go to next
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" only have emmet on html and css files
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" Using custom shortcut for emmet
let g:user_emmet_expandabbr_key='<C-S-Tab>'
imap <expr> <s-tab> emmet#expandAbbrIntelligent("\<s-tab>")

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
nnoremap <s-tab> za
" not as cool as syntax, but faster
set foldmethod=indent               
" start unfolded
set foldlevelstart=99               

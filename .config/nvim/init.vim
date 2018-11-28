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
let g:python_host_prog='usr/bin/python3'

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
	" Fuzzy finder
	call dein#add('Shougo/denite.nvim')

	" NerdTREE
	call dein#add('scrooloose/nerdtree')

	" Linting
	"call dein#add('w0rp/ale')

	" Completion Framework
	"call dein#add('Shougo/deoplete.nvim')
	"call dein#add('roxma/nvim-completion-manager')
	call dein#add('ncm2/ncm2')
	call dein#add('roxma/nvim-yarp')
	call dein#add('ncm2/ncm2-bufword')
	call dein#add('ncm2/ncm2-path')

	" Snippets
	call dein#add('Shougo/neosnippet.vim')
	call dein#add('Shougo/neosnippet-snippets')

	" Change date with <C-A> and <C-X>
	call dein#add('tpope/vim-speeddating')

	" Comment with <gcc>
	call dein#add('tpope/vim-commentary')

	" Enable multiple curors with <C-n>
	call dein#add('terryma/vim-multiple-cursors')

	" Code formating (see the github page for the compatible formatters)
	call dein#add('sbdchd/neoformat')

	" Java autocomplete
	" call dein#add('artur-shaik/vim-javacomplete2')

	" Add git status
	call dein#add('airblade/vim-gitgutter')

	" Git wrapper for vim
	call dein#add('tpope/vim-fugitive')

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

	" Nice looking vim !
	call dein#add('vim-airline/vim-airline')

	" Translations in vim buffer
	" call dein#add('soywod/vim-translate')
	
	" Pretty code
	" call dein#add('prettier/vim-prettier')

	" Tagbar
	call dein#add('majutsushi/tagbar')

	" Flow checking code
	call dein#add('flowtype/vim-flow')
	

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
" neosnippet configuration
" Control j to jump
imap <c-j>     <Plug>(neosnippet_expand_or_jump)
vmap <c-j>     <Plug>(neosnippet_expand_or_jump)
" Control u to expand
" inoremap <silent> <c-u> <c-r>=cm#sources#neosnippet#trigger_or_popup("\<Plug>(neosnippet_expand_or_jump)")<cr>
vmap <c-u>     <Plug>(neosnippet_expand_target)
" expand parameters
let g:neosnippet#enable_completed_snippet=1
" personal snippets
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" Tab go to next
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"" Neoformat
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" Auto prettify js
"autocmd BufWritePre *.js Neoformat

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

""" Mapping
"" Window switching with leader
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

"" Easy buffer switching
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>  

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

"" Netrw
" Using tree in netrw
let g:netrw_liststyle = 3
" Open files in a split window
let g:netrw_browse_split = 4
" Taking 20% of the space
let g:netrw_winsize = 20
" hide vim swap files
let g:netrw_list_hide='.*\.swp$'
" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_v = 1
" Disable the banner
let g:netrw_banner = 0
" Change directory to the current buffer when opening files.
set autochdir
" Opening NERDTree with SHift-Enter
noremap <S-CR> :NERDTreeToggle<CR>

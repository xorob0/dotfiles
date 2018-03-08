"*****************************************************************************
"" Plug install packages
"*****************************************************************************

"" Include user's extra bundle
if filereadable(expand("~/.config/nvim/local_bundles.vim"))
  source ~/.config/nvim/local_bundles.vim
endif
" Required:
filetype plugin indent on

set nocompatible
set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/ " path to dein.vim

call dein#begin(expand('~/.vim/dein')) " plugins' root path
" Plugin installer
call dein#add('Shougo/dein.vim')
" Enable multiple curors with <C-n>
"call dein#add('terryma/vim-multiple-cursors')
" Start drawing with <leader-d>
"call dein#add('vim-scripts/DrawIt')
" Autocompletion
call dein#add('Shougo/deoplete.nvim')
" Autocompletion for C like
call dein#add('zchee/deoplete-clang')
" Complete with tab
call dein#add('ervandew/supertab')
" See undo tree with F5
call dein#add('mbbill/undotree')
" Colorize parentheses
call dein#add('luochen1990/rainbow')
"call dein#add('caio/querycommandcomplete.vim')
" Navigate with F3
"call dein#add('scrooloose/nerdtree')
"call dein#add('jistr/vim-nerdtree-tabs')
" Comment with <gcc>
call dein#add('tpope/vim-commentary')
call dein#add('vim-airline/vim-airline')
" Nice looking vim !
call dein#add('vim-airline/vim-airline-themes')
" Add git status
call dein#add('airblade/vim-gitgutter')
" Syntax colorization for almost all languages
call dein#add('sheerun/vim-polyglot')
" Use Gvim color scheme in vim
"call dein#add('vim-scripts/CSApprox')
" Red space for python
"call dein#add('ntpeters/vim-better-whitespace')
" Automatic opening and closing of parentheses
call dein#add('Raimondi/delimitMate')
" Fuzzy search
"call dein#add('ctrlpvim/ctrlp.vim')
" Learn to use vim correctly
call dein#add('wikitopian/hardmode')
" Personal wiki in vim
call dein#add('vimwiki/vimwiki')
" Automatic opening and closing of parentheses
"call dein#add('jiangmiao/auto-pairs')
" See tags in a sidebar (exempel : class)
"call dein#add('majutsushi/tagbar')
" Synatx checking
"call dein#add('scrooloose/syntastic')
if v:version >= 704
	"" Snippets
"	call dein#add('SirVer/ultisnips')
	call dein#add('FelikZ/ctrlp-py-matcher')
	call dein#add('honza/vim-snippets')
	call dein#add('MarcWeber/vim-addon-mw-utils')
""	call dein#add('garbas/vim-snipmate')
endif
"
"
" Help with autocompletion of c
call dein#add('vim-scripts/c.vim')
""" Color
" Nice looking color scheme
call dein#add('tomasr/molokai')
" Show indent level
call dein#add('nathanaelkane/vim-indent-guides')

" and a lot more plugins.....
"

" Add functions like Delete, Move, SudoWrite,...
call dein#add('tpope/vim-eunuch')
" Surround with cs"'
call dein#add('tpope/vim-surround')
" Git wrapper
call dein#add('tpope/vim-fugitive')
call dein#add('tommcdo/vim-fugitive-blame-ext')
" Add HTML5 support
call dein#add('othree/html5.vim')
" Add markdown support
call dein#add('tpope/vim-markdown', { 'for': ['markdown'] })
" Abolish an often mistyped word, rename easily with in all scenario, and
" change coercion
call dein#add('tpope/vim-abolish')
" Change date with <C-A> and <C-X>
call dein#add('tpope/vim-speeddating')
" Add optons to ga
"call dein#add('tpope/vim-characterize')
" Easy select inside parentheses when inside multiple parentheses
call dein#add('gcmt/wildfire.vim')
" Indentation according to most used guideline by languages
"call dein#add('sdanielf/vim-stdtabs')
" comment with <Leader>cc
"call dein#add('scrooloose/nerdcommenter')
" Move by tag in second buffer
"call dein#add( 'vim-scripts/taglist.vim')
" Add latex support
"call dein#add( 'jcf/vim-latex')
"call dein#add( 'git://git.code.sf.net/p/atp-vim/code')
"call dein#add('christoomey/vim-tmux-navigator')
"call dein#add('justinmk/vim-sneak')
"call dein#add('wesQ3/vim-windowswap')
"call dein#add('lordm/vim-browser-reload-linux')
"call dein#add('junegunn/goyo.vim')
"call dein#add('junegunn/limelight.vim')
"call dein#add('tommcdo/vim-exchange')
"call dein#add('nathanaelkane/vim-indent-guides')
"call dein#add('LucHermitte/lh-vim-lib' | Plug 'LucHermitte/local_vimrc')
"call dein#add('brookhong/DBGPavim')
"call dein#add('sjl/gundo.vim')
"call dein#add('junegunn/fzf')
"call dein#add( 'floobits/floobits-neovim')
"call dein#add('terryma/vim-multiple-cursors')
"call dein#add('vim-scripts/RelOps')
"call dein#add('jeffkreeftmeijer/vim-numbertoggle')
"call dein#add('benmills/vimux')
"call dein#add('swekaj/php-foldexpr.vim')
"call dein#add('reedes/vim-pencil')
"call dein#add('reedes/vim-lexical')
"call dein#add('reedes/vim-wordy')
"call dein#add('kana/vim-textobj-user')
"call dein#add('reedes/vim-textobj-sentence')
"call dein#add('reedes/vim-textobj-quote')
"call dein#add('alerque/vim-sile', { 'for': 'sile' })
"call dein#add('severin-lemaignan/vim-minimap')
"call dein#add('vim-scripts/vim-auto-save')
"call dein#add('lervag/vimtex', { 'for': 'tex' })
"call dein#add('gisraptor/vim-lilypond-integrator', { 'for': 'lilypond' })
"call dein#add('trusktr/seti.vim')
" Add support for Markdown
"call dein#add('vim-pandoc/vim-pandoc-syntax', { 'for': ['markdown', 'pandoc'] })
"call dein#add('vim-pandoc/vim-pandoc', { 'for': ['markdown', 'pandoc'] })
"call dein#add('vim-pandoc/vim-markdownfootnotes', { 'for': 'pandoc' })
"call dein#add('vim-pandoc/vim-criticmarkup', { 'for': ['markdown', 'pandoc'] })
"call dein#add('benekastah/neomake')
"call dein#add('junegunn/vim-easy-align')
"call dein#add('neovimhaskell/haskell-vim', { 'for': 'haskell' })
"call dein#add('cazador481/fakeclip.neovim')
"call dein#add('majutsushi/tagbar')
"call dein#add('rust-lang/rust.vim')

call dein#end()


if dein#check_install()
  call dein#install()
endif

set runtimepath+=~/.config/nvim/cache/deoplete.nvim/
call deoplete#enable()

let g:deoplete#source={}
let g:deoplete#source._=['buffer', 'file', 'ultisnips']
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

if !exists('g:not_finish_vimplug')
  colorscheme molokai
endif

let g:rainbow_active = 1

    let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['green', 'cyan', 'magenta', 'yellow'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

let g:gitgutter_realtime = 1
set updatetime=1000

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Causing error on exit
"autocmd BufWritePre * StripWhitespace
"*****************************************************************************
"" Basic Setup
"*****************************************************************************"

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

set cursorline

"" Tabs. May be overriten by autocmd rules
set tabstop=4
"set softtabstop=4
set shiftwidth=4
set expandtab

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
set noswapfile

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/sh

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

" Python support
let g:python_host_prog='usr/bin/python3'

" Set map leader
let mapleader = ","
let g:mapleader = ","

" Show special caracter on indented lines
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=233
let g:indent_guides_exclude_filetype = ['help', 'nerdtree']
let g:indent_guides_default_mapping = 0

"" User interface

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

let no_buffers_menu=1

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  " IndentLine
  let g:indentLine_enabled = 1
  let g:indentLine_concealcursor = 0
  let g:indentLine_char = '┆'
  let g:indentLine_faster = 1


endif

if &term =~ '256color'
  set t_ut=
endif

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
let g:airline_theme = 'murmur'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeTabsToggle<CR>

" vimshell.vim
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

" terminal emulation
"if g:vim_bootstrap_editor == 'nvim'
"  nnoremap <silent> <leader>sh :terminal<CR>
"else
"  nnoremap <silent> <leader>sh :VimShellCreate<CR>
"endif

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" ctrlp.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|tox|ico|git|hg|svn))$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 1

" The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = '<leader>e'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>


"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

"" Custom configs

" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4 smartindent
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

" syntastic
let g:syntastic_python_checkers=['python', 'flake8']

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1


"autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
"autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab

"" Include user's local vim config
if filereadable(expand("~/.config/nvim/local_init.vim"))
  source ~/.config/nvim/local_init.vim
endif

"*****************************************************************************
"" Convenience variables
"*****************************************************************************

" vim-airline
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


" Enable transparency
hi Normal guibg=NONE ctermbg=NONE

" Inverse tab in completion
let g:SuperTabDefaultCompletionType = "<c-n>"

" Visual Studio like braces
let b:delimitMate_expand_space = 1
let b:delimitMate_expand_cr = 1

" See undo tree with F5
nnoremap <F5> :UndotreeToggle<cr>

" Setting settings for my personnal wiki
let g:vimwiki_list = [{'path': '~/Documents/VimWiki/personal.wiki',
                    \ 'path_html': '~/Documents/VimWiki/personal.wiki_html'}
                    \ ]

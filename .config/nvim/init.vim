""" General
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Autoload files changes
set autoread

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
set smartcase

"" Encoding
set bomb
set binary

" Don’t add empty newlines at the end of files
set noeol

"" Directories for swp files
set nobackup

" Save undo trees
set undofile

set fileformats=unix,dos,mac
set showcmd
"" set zsh as default shell
set shell=/bin/zsh

" Optimize for fast terminal connections
set ttyfast

" Always keep the cursor at the middle of the screen
set scrolloff=999

" Allow colors for terminal
set termguicolors

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Show “invisible” characters
set lcs=tab:\ ,trail:,eol:¬,nbsp:_,extends:ﲒ
set list

" Don’t show the intro message when starting Vim
set shortmess=atI

"" Cool compltetion
set wildmode=longest,list,full
set wildmenu

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

""" Visual
syntax on
set ruler
set number
set relativenumber

" Show tabline
set showtabline=2  

"" Use modeline overrides
set modeline
set modelines=10

""" Plugins
if &compatible
	set nocompatible
endif

" Session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "yes"
let g:session_autosave = "yes"
let g:session_command_aliases = 1

" Python support
let g:python_host_prog='/usr/bin/python3.7'

""" Plugins
" Loading plug
call plug#begin('~/.vim/plugged')

" Icons
Plug 'ryanoasis/vim-devicons'

" Completion Framework
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Completion Extentions
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-sources', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-emmet', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tslint-plugin', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-tailwindcss', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-vimtex', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-stylelint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tabnine', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/vim-jsx-improve', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-jest', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-vetur', {'do': 'yarn install --frozen-lockfile'}
Plug 'voldikss/coc-translator', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-styled-components', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-gitignore', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-webpack', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-flutter', {'do': 'yarn install --frozen-lockfile'}
Plug 'coc-extensions/coc-svelte', {'do': 'yarn install --frozen-lockfile'}

"" Git stuff
" Git wrapper for vim
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-rhubarb'
" Git branchviewer
Plug 'rbong/vim-flog'
" Perfect git plugin
Plug 'iamcco/sran.nvim', { 'do': { -> sran#util#install() } }
Plug 'iamcco/git-p.nvim'

" TS syntax
Plug 'HerringtonDarkholme/yats.vim'

"" Docs generation
Plug 'kkoomen/vim-doge'

" Change date with <C-A> and <C-X>
Plug 'tpope/vim-speeddating'

" Comment with <gcc>
Plug 'tomtom/tcomment_vim'

" Enable multiple curors with <C-n>
Plug 'terryma/vim-multiple-cursors'

" Syntax colorization for almost all languages
Plug 'sheerun/vim-polyglot'

" Add functions like Delete, Move, SudoWrite,...
Plug 'tpope/vim-eunuch'

" Surround with cs"'
Plug 'tpope/vim-surround'

" See undo tree with F5
Plug 'mbbill/undotree'

" Colorize parentheses
Plug 'luochen1990/rainbow'

" Cool surround control"
Plug 'machakann/vim-sandwich'

" Magnificent theme
Plug 'arcticicestudio/nord-vim'

" Show indent level
Plug 'nathanaelkane/vim-indent-guides'

" Custom status line
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" Translations in vim buffer
Plug 'VincentCordobes/vim-translate'

" Tagbar
Plug 'majutsushi/tagbar'

" " Coloring CSS files
Plug 'norcalli/nvim-colorizer.lua'

" Everything fuzzy finder
Plug 'liuchengxu/vim-clap'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim'

" LaTeX preview
Plug 'donRaphaco/neotex', { 'for': 'tex' }

" Show registers content before user
Plug 'junegunn/vim-peekaboo'

" Better search
Plug 'junegunn/vim-slash'

" Grammar checking
Plug 'rhysd/vim-grammarous'

" Smart f 
Plug 'rhysd/clever-f.vim'

" Fancy start screen
Plug 'mhinz/vim-startify'

" Focus mode
Plug 'junegunn/limelight.vim', { 'on': 'Limelight!!' }

" Quokka is not free
" Plug 'metakirby5/codi.vim'
Plug 'Pablo1107/codi.vim', { 'branch': 'nvim-virtual-text' }

" Easy window swapping
" Plug 'wesQ3/vim-windowswap'

" Search for TODO, FIXME and XXX
Plug 'gilsondev/searchtasks.vim'

" smooth scrolling
Plug 'joeytwiddle/sexy_scroller.vim'

Plug 'fannheyward/coc-deno'

call plug#end()

""" Mappings

" Set map leader
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

"save current buffer
nnoremap <leader>w :w<cr>

"move lines around
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==
xnoremap <leader>k :m-2<cr>gv=gv
xnoremap <leader>j :m'>+<cr>gv=gv

"create a new buffer (save it with :w ./path/to/FILENAME)
nnoremap <leader>B :enew<cr>
"close current buffer
nnoremap <leader>bq :bp <bar> bd! #<cr>
"close all open buffers
nnoremap <leader>ba :bufdo bd!<cr>

"Tab to switch to next open buffer
nnoremap <Tab> :bnext<cr>
"Shift + Tab to switch to previous open buffer
nnoremap <S-Tab> :bprevious<cr>

"move to the split in the direction shown, or create a new split
nnoremap <silent> <C-h> :call WinMove('h')<cr>
nnoremap <silent> <C-j> :call WinMove('j')<cr>
nnoremap <silent> <C-k> :call WinMove('k')<cr>
nnoremap <silent> <C-l> :call WinMove('l')<cr>

function! WinMove(key)
	let t:curwin = winnr()
	exec "wincmd ".a:key
	if (t:curwin == winnr())
		if (match(a:key,'[jk]'))
			wincmd v
		else
			wincmd s
		endif
		exec "wincmd ".a:key
	endif
endfunction

"" Center search completion
noremap <plug>(slash-after) zz

"" Fuzzy search mapping
map <leader><leader> :Clap files<CR>
map <leader>/ :Clap grep<CR>


"" Easier Diff
map <leader>r :diffg RE<CR>
map <leader>o :diffg LO<CR>
map <leader>b :diffg BA<CR>

"" Open Startify
nmap <leader>st :Startify<cr>

"" COC
" Prettier
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

"" COC mappings
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Run jest for current test
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>

" use <leader>df to display line git diff
nmap <leader>df <Plug>(git-p-diff-preview)

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

" make PR from vim (github only)
noremap <leader>pr :!hub pull-request<CR>

""" Addons configuration
"" Autocompletion
" Use Tab to move around inside the snippet
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

"" Flow
" Don't show quickfix
let g:flow#showquickfix = 0

"" Activate rainbow parentheses
let g:rainbow_active = 1

"" Activate GitGutter
let g:gitgutter_realtime = 1

"" Theme
if !exists('g:not_finish_vimplug')
	" Enable italic
	let g:nord_italic = 1
	let g:nord_italic_comments = 1
	" Uniform status lines
	let g:nord_uniform_status_lines = 1
	" Better looking diff
	let g:nord_uniform_diff_background = 1
	" Background goes all the way to the numbers
	let g:nord_cursor_line_number_background = 1
	" Better looking separations
	let g:nord_bold_vertical_split_line = 1
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

"" Markdown preview
" Open the preview when opening a md file
let g:mkdp_auto_start = 1

"" Copy/Paste/Cut
if has('unnamedplus')
	set clipboard=unnamed,unnamedplus
endif

"" Smart f settings
let g:clever_f_smart_case = 1

"" Startify
let g:startify_files_number = 15
let g:startify_change_to_dir = 0
let g:startify_custom_header = [ ]
let g:startify_relative_path = 1
let g:startify_use_env = 1

function! s:list_commits()
	let git = 'git -C ' . getcwd()
	let commits = systemlist(git . ' log --oneline | head -n5')
	let git = 'G' . git[1:]
	return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction

" Custom startup list, only show MRU from current directory/project
let g:startify_lists = [
			\  { 'type': 'dir',       'header': [ 'Files '. getcwd() ] },
			\  { 'type': 'files',       'header': [ 'Files '. getcwd() ] },
			\  { 'type': 'sessions',  'header': [ 'Sessions' ]       },
			\  { 'type': function('s:list_commits'), 'header': [ 'Recent Commits' ] },
			\  { 'type': 'bookmarks', 'header': [ 'Bookmarks' ]      },
			\  { 'type': 'commands',  'header': [ 'Commands' ]       },
			\ ]

let g:startify_commands = [
			\   { 'f': [ 'Open FZF', ':FZF' ] },
			\   { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
			\   { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
			\ ]

let g:startify_bookmarks = [
			\ { 'c': '~/.config/nvim/init.vim' },
			\ { 'z': '~/.zshrc' }
			\ ]

autocmd User Startified setlocal cursorline

"" COC
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" Init jest in current cwd, require global jest command exists
command! JestInit :call CocAction('runCommand', 'jest.init')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Show doc on hover
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Auto doc help
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" format blame virtual text
let g:gitp_blame_format = '   %{account} 神%{ago}  %{commit}'

" Setting for Codi
let g:codi#aliases = {
	 \ 'javascript.jsx': 'javascript',
	 \ }
let g:codi#rightalign = 0 
let g:codi#virtual_text_prefix = ' ﬌ '
highlight CodiVirtualText cterm=bold ctermfg=3 guibg=LightYellow

let g:clap_current_selection_sign = { 'text': ' ', 'texthl': 'WarningMsg', 'linehl': 'ClapCurrentSelection'}

""" Theme
let no_buffers_menu=1

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

"" Indent indicator colors
hi IndentGuidesOdd  guibg='#2e3440'
hi IndentGuidesEven guibg='#3b4252'

function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
	return winwidth(0) > 70 ? (WebDevIconsGetFileFormatSymbol()) : ''
endfunction

let g:lightline = {
			\   'colorscheme': 'wombat',
			\   'active': {
			\     'left':[ [ 'mode', 'paste' ],
			\              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
			\     ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
			\   },
			\   'component': {
			\     'lineinfo': '%3l:%-2v',
			\   },
			\   'component_function': {
			\     'gitbranch': 'fugitive#head',
			\	    'filetype': 'MyFiletype',
			\	    'fileformat': 'MyFileformat',
			\   }
			\ }
let g:lightline.separator = {
			\   'left': '', 'right': ''
			\}
let g:lightline.subseparator = {
			\   'left': '', 'right': '' 
			\}
let g:lightline.tabline = {
			\		'left': [['buffers']],
			\		'right': [['close']]
			\}
let g:lightline.component_expand = {
			\		'buffers': 'lightline#bufferline#buffers'
			\}
let g:lightline.component_type = {
			\		'buffers': 'tabsel'
			\}

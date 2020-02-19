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

"" Blocking all the interrupting errors
set shortmess=saoOTIAcF
set cmdheight=1
set noshowmode
set noshowcmd
set nomodeline
set nowarn
set noerrorbells
set noexrc

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

" Time to wait before registering an input
set timeoutlen=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

""" Visual
syntax on
set ruler
set number relativenumber

"Show tabline
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
" If not installed, install Plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync
endif
" Loading plug
call plug#begin('~/.vim/plugged')

" Icons
Plug 'ryanoasis/vim-devicons'

" Completion Framework
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" " Completion Extentions
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile', 'for' : ['typescript', 'typescriptreact']}
Plug 'neoclide/coc-sources', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-emmet', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tslint-plugin', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile', 'for': ['css', 'wxss', 'scss', 'less', 'postcss', 'sugarss', 'vue']}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-vimtex', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-stylelint', {'do': 'yarn install --frozen-lockfile', 'for': ['css', 'wxss', 'scss', 'less', 'postcss', 'sugarss', 'vue']}
Plug 'neoclide/vim-jsx-improve', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-jest', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-vetur', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-styled-components', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-gitignore', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-webpack', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-flutter', {'do': 'yarn install --frozen-lockfile'}
Plug 'coc-extensions/coc-svelte', {'do': 'yarn install --frozen-lockfile'}
Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}
Plug 'weirongxu/coc-calc', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-neco', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-deno', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-spell-checker', {'do': 'yarn install --frozen-lockfile'}
Plug 'tjdevries/coc-zsh', {'do': 'yarn install --frozen-lockfile'}
Plug 'amiralies/coc-flow', {'do': 'yarn install --frozen-lockfile'}
Plug 'danielwelch/coc-homeassistant', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-project', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-diagnostic', {'do': 'yarn install --frozen-lockfile && yarn build'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-markdownlint', {'do': 'yarn install --frozen-lockfile && yarn build'}
Plug 'aperezdc/vim-template'

" Coc snippets
Plug 'xabikos/vscode-react', {'do': 'yarn install --frozen-lockfile && yarn build'}
Plug 'xabikos/vscode-javascript', {'do': 'yarn install --frozen-lockfile && yarn build'}
Plug 'Rocketseat/rocketseat-vscode-react-native-snippets', {'do': 'yarn install --frozen-lockfile && yarn build'}
Plug 'abusaidm/html-snippets', {'do': 'yarn install --frozen-lockfile && yarn build'}
Plug 'Nash0x7E2/awesome-flutter-snippets', {'do': 'yarn install --frozen-lockfile && yarn build'}

" Needed for coc-neco
Plug 'Shougo/neco-vim'

"" Git stuff
" Git wrapper for vim
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" Git branchviewer
Plug 'rbong/vim-flog'
" Perfect git plugin
Plug 'iamcco/sran.nvim', { 'do': { -> sran#util#install() } }
Plug 'iamcco/git-p.nvim'

" TS syntax
Plug 'HerringtonDarkholme/yats.vim'

" Change date with <C-A> and <C-X>
Plug 'tpope/vim-speeddating'

" Comment with <gcc>
Plug 'tomtom/tcomment_vim'
" Plug 'cometsong/CommentFrame.vim'

" Enable multiple curors with <C-n> and more
Plug 'mg979/vim-visual-multi'

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

" " Coloring CSS files
Plug 'norcalli/nvim-colorizer.lua'

" Everything fuzzy finder
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" LaTeX preview
Plug 'donRaphaco/neotex', { 'for': 'tex' }

" Better search
Plug 'junegunn/vim-slash'

" Grammar checking
Plug 'rhysd/vim-grammarous'

" Smart f 
Plug 'rhysd/clever-f.vim'

" Fancy start screen
Plug 'mhinz/vim-startify'

" Focus mode
Plug 'xi/limelight.vim', { 'branch': 'feature-movement' }

" Quokka is not free
" Plug 'metakirby5/codi.vim'
Plug 'Pablo1107/codi.vim', { 'branch': 'nvim-virtual-text' }

" Search for TODO, FIXME and XXX
Plug 'gilsondev/searchtasks.vim'

" Documentation generator
Plug 'kkoomen/vim-doge'

" Rename both sides of a tag at once
Plug 'AndrewRadev/tagalong.vim'

" See dependencies information in packages.json
Plug 'meain/vim-package-info', { 'do': 'npm install' }

" Help to see all mappings
Plug 'liuchengxu/vim-which-key'

" Better line numbers
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" See what takes time on startup 
Plug 'dstein64/vim-startuptime'

" Better default
Plug 'tpope/vim-sensible'

" Jenkins integration
Plug 'burnettk/vim-jenkins'

" Debugger to piss off Fabio
Plug 'vim-vdebug/vdebug'

Plug 'junegunn/goyo.vim'

Plug 'kana/vim-repeat'
call plug#end()


" Function
" Creates a floating window with a most recent buffer to be used
function! CreateCenteredFloatingWindow()
    let width = float2nr(&columns * 0.6)
    let height = float2nr(&lines * 0.6)
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    autocmd BufWipeout <buffer> exe 'bwipeout '.s:buf
endfunction

function! ToggleTerm(cmd)
    if empty(bufname(a:cmd))
        call CreateCenteredFloatingWindow()
        call termopen(a:cmd, { 'on_exit': function('OnTermExit') })
    else
        bwipeout!
    endif
endfunction

function! ToggleScratchTerm()
    call ToggleTerm('zsh')
endfunction

function! ToggleLazyGit()
    call ToggleTerm('lazygit')
endfunction


function! OnTermExit(job_id, code, event) dict
    if a:code == 0
        bwipeout!
    endif
endfunction

""" Mappings

" Set map leader
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

"save current buffer
nnoremap <silent><leader>w :silent! w!<cr>
nnoremap <silent>\ :silent wa!\|qa!<cr>

"Backspace to save and quit
nnoremap <silent><BS> :silent :w!\|bd<cr>

"move lines around
" xnoremap <silent> K :silent m-2
" vnoremap <silent> J :silent m+
xnoremap <silent> K :m-2<cr>gv=gv
xnoremap <silent> J :m'>+<cr>gv=gv

"create a new buffer (save it with :w ./path/to/FILENAME)
nnoremap <leader>bo :enew!<cr>
"close current buffer
nnoremap <leader>bq :bp <bar> bd! #<cr>
"close all open buffers
nnoremap <leader>ba :bufdo bd!<cr>
" surrounds in normal mode
nnoremap <leader>" bi"<esc>lea"<esc>
nnoremap <leader>' bi'<esc>lea'<esc>
" surronds in visual mode
" the l is necessary because adding one character messes up the `>
vnoremap <leader>{ <esc>`<i{<esc>`>la}<esc>
vnoremap <leader>( <esc>`<i(<esc>`>la)<esc>
vnoremap <leader>[ <esc>`<i[<esc>`>la]<esc>
vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
" duplicate line
nnoremap <leader>l Vyp
" translator
nnoremap <silent> <leader>tt :Translate<CR>
vnoremap <silent> <leader>tt :TranslateVisual<CR>
vnoremap <silent> <leader>tr :TranslateReplace<CR>
nnoremap <leader>tt <Plug>Translate
nnoremap <leader>tr <Plug>TranslateReplace

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

" move to end of line
nnoremap L $
vnoremap L $
" move to start of line
nnoremap H ^
vnoremap H ^

"" Center search completion
noremap <plug>(slash-after) zz

"" Doc generation
let g:doge_mapping = '<Leader>o'

"" Fuzzy search mapping
nmap <leader><leader> :Clap files<CR>
nmap <leader>/ :Clap grep<CR>
nmap // :Clap blines<CR>
nmap <leader>h :Clap history<CR>
nmap <leader>" :Clap registers<CR>
nmap <leader>' :Clap marks<CR>
nmap <leader>n :Clap filer<CR>
nmap <leader>j :Clap jumps<CR>
nmap <leader>? :Clap maps<CR>

"" easy search and replace
nmap <leader>r :%s//g<left><left>

"" Easier Diff
nmap <leader>dr :diffg RE<CR>
nmap <leader>do :diffg LO<CR>
nmap <leader>db :diffg BA<CR>

" use <leader>df to display line git diff
nmap <leader>vd <Plug>(git-p-diff-preview)
nmap <leader>vb <Plug>(git-p-i-blame)

nnoremap <silent><leader>vw :silent! Gw!<cr>
nnoremap <silent><leader>vc :silent Gcommit!<cr>
nnoremap <silent><leader>vp :silent Gpush!<cr>
nnoremap <silent><leader>vpl :silent Gpull!<cr>

" open lazygit
nnoremap <silent> <leader>G :call ToggleLazyGit()<CR>

" open scratchtern
nnoremap <silent> <leader>T :call ToggleScratchTerm()<CR>

"" Open Startify
nmap <leader>s :Startify<cr>

"" COC
" Prettier
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [ <Plug>(coc-diagnostic-prev)
nmap <silent> ] <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

" coc-explorer
nmap <leader>e :CocCommand explorer<CR>

"" COC mappings
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
vmap <leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>q  <Plug>(coc-fix-current)

" Run jest for current test
" nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>

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
noremap <leader>vp :!hub pull-request<CR>

" Easy CocCommand
noremap <leader>cc :CocCommand 
noremap <leader>cf :CocCommand flutter.


" Exit terminal
tnoremap <Esc> <C-\><C-n>

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

"" Indent Guide
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=NONE
hi IndentGuidesEven ctermbg=0

"" Markdown preview
" Open the preview when opening a md file
let g:mkdp_auto_start = 0

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

" Properties for templates
let g:email = 'xorob0@posteo.net'
let g:username = 'xorob0'
let g:license = 'GPL'

" When term starts, auto go into insert mode
autocmd TermOpen * startinsert

" Turn off line numbers etc
autocmd TermOpen * setlocal listchars= nonumber norelativenumber

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
" highlight CodiVirtualText cterm=bold ctermfg=3 guibg=LightYellow

let g:clap_current_selection_sign = { 'text': ' ', 'texthl': 'WarningMsg', 'linehl': 'ClapCurrentSelection'}

let g:clap_provider_grep_delay = 0
let g:clap_popup_input_delay = 0

let g:translate#default_languages = { 'fr': 'en', 'en': 'fr' }

"" Help for leader mapping
let g:which_key_position="topleft"

let g:which_key_map = {
	\'name' : 'Leader',
	\'w' : 'Save silently',
	\'"' : 'Surround "',
	\"'" : "Surround \'",
	\'/' : 'Search in project',
	\'a' : 'Open actions',
	\'b' : {
		\ 'name' : '+buffers',
		\ 'o' : 'Open new',
		\ 'a' : 'Close',
		\ 'q' : 'Close all opened buffers'
  \ 	},
	\'g' : {
		\ 'name' : '+goTo',
		\ 'i' : 'Implementation',
		\ 'r' : 'References',
		\ 'y' : 'Type definition',
		\ 'd' : 'Definition'
  \ 	},
	\'o' : 'Generate documentation',
	\'e' : 'Open explorer on the right',
	\'pr' : 'Create a pull request',
	\'f' : 'Format selection',
	\'rn' : 'Rename variable',
	\'l' : 'Duplicate line',
	\'d' : {
		\ 'name' : '+diff',
		\ 'o' : 'Selecte mine',
		\ 'r' : 'Selecte yours',
		\ 'b' : 'Selecte older',
  \ 	},
	\'p' : {
		\ 'name' : '+git',
		\ 'b' : 'Blame of current line',
		\ 'd' : 'Diff of current line',
		\ 'p' : 'Open a pull request',
  \ 	},
	\'t' : {
		\ 'name' : '+translate',
		\ 'r' : 'Replace',
		\ 't' : 'Translate',
  \ 	},
	\'j' : 'Join bottom line to current line',
	\'r' : 'Search and replace',
	\'q' : 'Quickfix',
	\'s' : 'Startify',
	\'_' : {'name': 'which_key_ignore'},
	\'i' : {'name': 'which_key_ignore'},
  \ }

call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>

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

" Make fugitive work with husky
let g:fugitive_pty = 0

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#4c566a'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

let g:limelight_mode = 'movement'
let g:limelight_bop = '{'
let g:limelight_eop = '}'
let g:limelight_paragraph_span = 0


" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

augroup writing
	autocmd!
	autocmd InsertEnter * Limelight
	autocmd InsertLeave * :let __line=line('.')
	autocmd InsertLeave * :let __col=col('.')
	autocmd InsertLeave * Limelight!
	autocmd InsertLeave * :cal cursor(__line,__col)
	autocmd InsertLeave * :unlet __col
	autocmd InsertLeave * :unlet __line
augroup END
"

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

:autocmd BufEnter *.png,*.jpg,*gif exec "! kitty +kitten icat ".expand("%") | :bw


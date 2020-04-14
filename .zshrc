# Source envs
source "${HOME}/.zshenv"

system_type=$(uname -v | head -n1 | sed -e 's/\s.*$//' | head -n1 | sed 's/^[^-]*-//')

###############
### Plugins ###
###############
# Zgen install
source "${HOME}/.zgen/zgen.zsh"

# If the init script doesn't exist install the plugins
if ! zgen saved; then
	# oh-my-zsh plugins
	zgen oh-my-zsh plugins/vi-mode
	zgen oh-my-zsh plugins/systemd
	zgen oh-my-zsh plugins/git
	zgen oh-my-zsh plugins/compleat
	zgen oh-my-zsh plugins/copyfile
	zgen oh-my-zsh plugins/docker
	zgen oh-my-zsh plugins/extract
	zgen oh-my-zsh plugins/gitfast
	zgen oh-my-zsh plugins/git-extras
	zgen oh-my-zsh plugins/npm
	zgen oh-my-zsh plugins/pass
	zgen oh-my-zsh plugins/pip
	zgen oh-my-zsh plugins/yarn

	zgen load momo-lab/zsh-abbrev-alias

	zgen load romkatv/powerlevel10k powerlevel10k

# Auto pairs
	zgen load hlissner/zsh-autopair

	# 256 colors in the terminal
	zgen load chrissicool/zsh-256color

	# Highlight syntax
	zgen load zsh-users/zsh-syntax-highlighting
	zgen load zsh-users/zsh-completions src

	# Use z to jump around
	zgen load agkozak/zsh-z

	# Calculator
	zgen load arzzen/calc.plugin.zsh

# Fish like autosuggestions
	zgen load zsh-users/zsh-autosuggestions


	# Generate the init script from plugins above
	zgen save
fi

###################
### ZSH options ###
###################
# No need to type cd, just type the directory name
setopt AUTO_CD
# Spell check commands (Sometimes annoying)
setopt CORRECT
# Disable beeps
setopt NO_BEEP
# Compete aliases too
setopt COMPLETE_ALIASES

### Setting aliases
# Conditionnal aliases
function rm mv () {
    if git rev-parse --is-inside-work-tree &> /dev/null
    then
        git $0 "$@"
    else
        command $0 "$@"
    fi
}

function git () {
    if which hub 0 &> /dev/null
    then
        hub "$@"
    else
        command $0 "$@"
    fi
}

function ls () {
    if which lsd &> /dev/null
    then
        lsd "$@"
    else
        command $0 "$@"
    fi
}

function rm () {
    if which trash-put &> /dev/null
    then
        echo "This is not the command you are looking for"; false
    else
        command $0 "$@"
    fi
}

function install () {
	case $system_type in
		Ubuntu|Microsoft)
			sudo apt install "$@"
			;;
		archlinux)
			sudo pacman -S "$@"
			;;
		*)
			echo "This os is not supported"
			;;
	esac
}

function update () {
	case $system_type in
		Ubuntu|Microsoft)
			sudo apt update
			;;
		archlinux)
			sudo pacman -Syy "$@"
			;;
		*)
			echo "This os is not supported"
			;;
	esac
}

function upgrade () {
	update
	case $system_type in
		Ubuntu|Microsoft)
			sudo apt upgrade "$@"
			;;
		archlinux)
			sudo pacman -Syu "$@"
			;;
		*)
			echo "This os is not supported"
			;;
	esac
}


# Colorized aliases for ls
abbrev-alias l="ls"
abbrev-alias ll='ls -l'
abbrev-alias lt='ls -lt'
abbrev-alias lla='ls -lA'
abbrev-alias la='ls -A'
abbrev-alias lg='ls -l | grep'
# Easy .zshrc edit
alias zshrc="$EDITOR ~/.zshrc"
# History access
abbrev-alias hist="history"
# Obligatory git aliases
# Hub alisaes
abbrev-alias hpr="hub pull-request"
abbrev-alias hc="hub create"
abbrev-alias hb="hub browse"
abbrev-alias ga="git add"
abbrev-alias gc="git commit -m"
abbrev-alias gC="git commit"
abbrev-alias gcl="git clone"
abbrev-alias gaa="git add -A"
abbrev-alias gca="git commit -am"
abbrev-alias gpl="git pull"
abbrev-alias gp="git push"
abbrev-alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue) <%an> %Creset' --abbrev-commit"
abbrev-alias gs="git status -s"
abbrev-alias gb="git branch"
abbrev-alias gm="git merge"
abbrev-alias gmv="git mv"
abbrev-alias grm="git rm"
abbrev-alias gck="git checkout"
abbrev-alias gcb="git checkout -b"
abbrev-alias gcd="git checkout develop"
abbrev-alias gcm="git checkout master"
abbrev-alias gf="git fetch"
abbrev-alias gmd="git merge develop"
abbrev-alias gmm="git merge master"
abbrev-alias gmt="git mergetool"
abbrev-alias gpu="git push -u origin HEAD"
abbrev-alias gcz="git cz"
abbrev-alias nov="git commit --no-verify"
# Top order
abbrev-alias cpu='top -o cpu'   # CPU
abbrev-alias mem='top -o rsize' # Memory
# Convert document to pdf
alias doc2pdf="libreoffice --headless --convert-to pdf *.docx"
alias odt2pdf="libreoffice --headless --convert-to pdf *.odt"
# Enable the trash
alias /rm="rm"
abbrev-alias tp='trash-put'
# Some abbrev-alias for backward directory
abbrev-alias -g ..=".."
abbrev-alias -g ...='../..'
abbrev-alias -g ....='../../..'
abbrev-alias -g .....='../../../..'
abbrev-alias -g ......='../../../../..'
# Easy Grep
abbrev-alias -g G='| grep'
# Easy Sudo
abbrev-alias _='sudo'
# editor
abbrev-alias -g e='editor'
abbrev-alias se='sudo editor'
# Python
abbrev-alias p='python'
abbrev-alias p2='python2'
abbrev-alias pi='pip install'
# For when I forget I'm in normal mode in zsh
abbrev-alias nger="ranger"
# Root GUI
abbrev-alias zl='xhost +local'
# Youtube downloades
abbrev-alias yt='youtube-dl'
# easier open
alias open='mimeopen'
abbrev-alias o='open'
# fd
abbrev-alias fd='fdfind'

alias codi="vim -c 'let g:startify_disable_at_vimenter = 1 | set bt=nofile ls=0 noru nonu nornu | hi ColorColumn ctermbg=NONE | hi VertSplit ctermbg=NONE | hi NonText ctermfg=0 | Codi' example.ts"

### Completion things
zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/toum/.zshrc'
# Launch comletion module
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi
# Immediatelly insert first match
setopt MENU_COMPLETE
# Use cache for faster zsh
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
# Color completion
zstyle ':completion:*' list-colors ''
# Menu selection for completion
zstyle ':completion:*:*:*:*:*' menu select
# Group matches and describe.
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
# Complete PID with kill command with colors
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' insert-ids single
# Complete killall command
zstyle ':completion:*:processes-names' command "ps -eo cmd= | sed 's:\([^ ]*\).*:\1:;s:\(/[^ ]*/\)::;/^\[/d'"
# Fuzzy match mistyped completions.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original
zstyle ':completion:*:approximate:*' max-errors 1 numeric
# Increase the number of errors based on the length of the typed word.
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
# Don't complete uninteresting users...
zstyle ':completion:*:*:*:users' ignored-patterns \
	adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
	dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
	hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
	mailman mailnull mldonkey mysql nagios \
	named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
	operator pcap postfix postgres privoxy pulse pvm quagga radvd \
	rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs '_*'
# Better nvim completion
zstyle ':completion:*:*:(nvim|vim|rview|vimdiff|xxd|e):*:*files' \
	ignored-patterns '*~|*.(old|bak|zwc|viminfo|rxvt-*|zcompdump)|pm_to_blib|cover_db|blib' \
	file-sort modification
zstyle ':completion:*:*:(nvim|vim|rview|vimdiff|xxd|e):*' \
	file-sort modification
zstyle ':completion:*:*:(nvim|vim|rview|vimdiff|xxd|e):*' \
	tag-order files
zstyle ':completion:*:nvim:*:directories' ignored-patterns \*
# Better cd completion
zstyle ':completion:*:*:(cd):*:*files' ignored-patterns '*~' file-sort access
zstyle ':completion:*:*:(cd):*'        file-sort access
zstyle ':completion:*:*:(cd):*'        menu select
zstyle ':completion:*:*:(cd):*'        completer _history
# Defining reash
_force_rehash() {
	(( CURRENT == 1 )) && rehash
	return 1  # Because we didn't really complete anything
}
# Some more completion magic
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' completer _expand _force_rehash _complete _approximate _ignored
# Generate description
zstyle ':completion:*' auto-description 'specify: %d'
## Separate man page sections
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
# Set autosuggestions colors
eval "`dircolors -b ~/.dircolors`"
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")';
# SSH/SCP/RSYNC
zstyle ':completion:*:(scp|rsync):*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:ssh:*' group-order users hosts-domain hosts-host users hosts-ipaddr
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost localhost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^[-[:alnum:]]##(.[-[:alnum:]]##)##' '*@*'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'
# Ignore multiple entries.
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*:rm:*' file-patterns '*:all-files'
# Fuzzy match mistyped completions.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
# Increase the number of errors based on the length of the typed word.
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
# Don't complete unavailable commands.
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
# Array completion element sorting.
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
# Directories
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true
# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# Environmental Variables
zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

# Populate hostname completion.
zstyle -e ':completion:*:hosts' hosts 'reply=(
  ${=${=${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) 2>/dev/null)"}%%[#| ]*}//\]:[0-9]*/ }//,/ }//\[/ }
  ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*}
  ${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
)'

### History Stuff
# Where it gets saved
HISTFILE=~/.history
# Remember about a years worth of history (AWESOME)
SAVEHIST=10000
HISTSIZE=10000
# Save beginning and end of history
setopt extended_history
# Delete older line if command is duplicate in history
setopt hist_ignore_all_dups
# Append to histry as soon as the comand is executed
setopt inc_append_history
# Share history between terminals
setopt share_history
# Do not keep blanks in history
setopt hist_reduce_blanks
# Ignore command starting with a space
setopt histignorespace

### Keybindigs
# Working backspace
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char
# For fish like autocomplete
bindkey '^[[Z' reverse-menu-complete
# Search with up down
bindkey '^[[A' history-beginning-search-backward
bindkey '^[OA' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey '^[OB' history-beginning-search-forward
# The following lines were added by compinstall

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS+=brackets

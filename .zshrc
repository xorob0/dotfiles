# Source envs
source "${HOME}/.zshenv"

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
	zgen oh-my-zsh plugins/archlinux
	zgen oh-my-zsh plugins/compleat
	zgen oh-my-zsh plugins/copyfile
	zgen oh-my-zsh plugins/docker
	zgen oh-my-zsh plugins/extract
	zgen oh-my-zsh plugins/gitfast
	zgen oh-my-zsh plugins/git-extras
	zgen oh-my-zsh plugins/npm
	zgen oh-my-zsh plugins/pass
	# zgen oh-my-zsh plugins/per-directory-history
	zgen oh-my-zsh plugins/pip
	zgen oh-my-zsh plugins/sudo
	zgen oh-my-zsh plugins/yarn

	zgen load romkatv/powerlevel10k powerlevel10k

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

	# interactive git
	zgen load wfxr/forgit

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
# Colorized aliases for ls
alias l="lsd"
alias ls="lsd"
alias ll='l -l'
alias lsl='ls -l'
alias lt='l -lt'
alias lst='ls -lt'
alias lla='l -lA'
alias lsla='l -lA'
alias la='l -A'
alias lsa='ls -A'
alias lg='l -l | grep'
alias lsg='ls -l | grep'
# Easy .zshrc edit
alias zshrc="$EDITOR ~/.zshrc"
# History access
alias hist="history"
# Obligatory git aliases
# Hub alisaes
alias h="hub"
alias hpr="hub pull-request"
alias hc="hub create"
alias hb="hub browse"
alias g="h"
# alias ga="g add"
alias gc="g commit -m"
alias gC="g commit"
alias gcl="g clone"
alias gaa="g add -A"
alias gcm="g commit -am"
alias gpl="g pull"
alias gp="g push"
alias gl="g log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue) <%an> %Creset' --abbrev-commit"
alias gs="g status -s"
alias gb="g branch"
alias gm="g merge"
alias gmv="g mv"
alias grm="g rm"
alias gck="g checkout"
alias gcb="g checkout -b"
alias gcd="g checkout develop"
alias gcm="g checkout master"
alias gf="g fetch"
alias gmd="g merge develop"
alias gmm="g merge master"
alias gmt="g mergetool"
alias gpu="g push -u origin HEAD"
alias gcz="g cz"
# Top order
alias cpu='top -o cpu'   # CPU
alias mem='top -o rsize' # Memory
# Convert document to pdf
alias doc2pdf="libreoffice --headless --convert-to pdf *.docx"
alias odt2pdf="libreoffice --headless --convert-to pdf *.odt"
# Enable the trash
alias rm='echo "This is not the command you are looking for"; false'
alias /rm="rm"
alias tp='trash-put'
# Some alias for backward directory
alias -g ..=".."
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
# Easy Grep
alias -g G='| grep'
# Easy Sudo
alias _='sudo'
# Wifi-menu (obfscated and non-obfuscated passwords)
alias wm='sudo wifi-menu -o'
alias wmm='sudo wifi-menu'
# editor
alias -g e='$EDITOR'
alias se='sudo $EDITOR'
# Python
alias p='python'
alias p2='python2'
alias pi='pip install'
# For when I forget I'm in normal mode in zsh
alias nger="ranger"
# Root GUI
alias zl='xhost +local'
# Youtube downloades
alias yt='youtube-dl'
# easier open
alias open='mimeopen'
alias o='mimeopen'
# fd
alias fd='fdfind'

alias codi="vim -c 'let g:startify_disable_at_vimenter = 1 | set bt=nofile ls=0 noru nonu nornu | hi ColorColumn ctermbg=NONE | hi VertSplit ctermbg=NONE | hi NonText ctermfg=0 | Codi'"

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
# Complete PID with kill command with colors
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
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
# Set autosuggestions colors
eval "`dircolors -b ~/.dircolors`"
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")';

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

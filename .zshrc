###############
### Plugins ###
###############
# Zgen install
source "${HOME}/.zgen/zgen.zsh"

# If the init script doesn't exist install the plugins
if ! zgen saved; then
	# oh-my-zsh plugins
	zgen oh-my-zsh plugins/vi-mode
	zgen oh-my-zsh plugins/pass
	zgen oh-my-zsh plugins/systemd
	zgen oh-my-zsh plugins/git

	# Magnificent theme
	zgen load bhilburn/powerlevel9k powerlevel9k

	# 256 colors in the terminal
	zgen load chrissicool/zsh-256color

	# Highlight syntax
	zgen load zsh-users/zsh-syntax-highlighting
	zgen load zsh-users/zsh-completions src

	# Generate the init script from plugins above
	zgen save
fi

# Fish like autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

### Configure plugins
## Personnal theme for PowerLevel9k
# Compatibility with font Awesome
POWERLEVEL9K_MODE='awesome-fontconfig'
# Installation path
POWERLEVEL9K_INSTALLATION_PATH=/home/xorob0/.zgen/bhilburn/powerlevel9k-master/powerlevel9k.zsh-theme
# Elements on the left
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir_writable dir)
# Elements on the right
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time vi_mode)
# Colorscheme
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='034'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='254'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='031'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='254'
POWERLEVEL9K_COLOR_SCHEME='light'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='242'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='254'
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='160'
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='254'
POWERLEVEL9K_DIR_HOME_BACKGROUND='031'
POWERLEVEL9K_DIR_HOME_FOREGROUND='254'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='031'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='254'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='031'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='254'

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
# The fuck
eval $(thefuck --alias)
# Colorized, list and dotfile with ls
alias ll='ls -lhF'
alias llt='ls -lht'
alias lla='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls="colorls"
alias ls_old="ls --color=auto"
alias ldot="ls -ld .*"
alias lg='ls | grep'
# Easy .zshrc edit
alias zshrc="$EDITOR ~/.zshrc"
# History access
alias h="history"
# Obligatory git aliases
alias ga="git add"
alias gc="git commit -m"
alias gca="git commit -am"
alias gpl="git pull"
alias gp="git push"
alias gl="git log --pretty=format:'%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --decorate --date=short"
alias gs="git status -s"
# Automatic sudo for pacman
alias pacman='sudo pacman'
# Cool gtypist
alias gtypist='gtypist -b -i'
# Graphical ping
alias ping_old='/bin/ping'
alias ping='gping'
# Graphical top
alias top_old='/bin/top'
alias top='gtop'
# Top order
alias cpu='top -o cpu'   # CPU
alias mem='top -o rsize' # Memory
# Convert document to pdf
alias doc2pdf="libreoffice --headless --convert-to pdf *.docx"
alias odt2pdf="libreoffice --headless --convert-to pdf *.odt"
# Canto
alias canto="canto-curses"
# Tomato
alias poatao="clear && potato"
# Enable the trash
alias rm='echo "This is not the command you are looking for"; false'
alias /rm="rm"
alias tp='trash-put'
# Some alias for backward directory
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
# Easy Grep
alias -g G='| grep'
# Easy Sudo
alias _='sudo'
# Wifi-menu (obfscated and non-obfuscated passwords)
alias wm='wifi-menu -o'
alias wmm='wifi-menu'
# editor
alias e='$EDITOR'
# Python
alias p='python'
alias p2='python2'
alias pi='pip install'
# For when I forget I'm in normal mode in zsh
alias nger="ranger"
# Root GUI
alias zl='xhost +local'

### Completion things
# Launch comletion module
autoload -Uz compinit
# Always put the cursor at the end
#setopt ALWAYS_TO_END
# Immediatelly insert first match
setopt MENU_COMPLETE
# Use cache for faster zsh
#zstyle ':completion:*' accept-exact '*(N)'
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
zstyle ':completion:*:*:(nvim|vim|rview|vimdiff|xxd):*:*files' \
	ignored-patterns '*~|*.(old|bak|zwc|viminfo|rxvt-*|zcompdump)|pm_to_blib|cover_db|blib' \
	file-sort modification
zstyle ':completion:*:*:(nvim|vim|rview|vimdiff|xxd):*' \
	file-sort modification
zstyle ':completion:*:*:(nvim|vim|rview|vimdiff|xxd):*' \
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
# Ignore some command in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

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

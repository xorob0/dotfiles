### Exporting variables
export EDITOR="nvim"
export LANG="en_US.UTF-8"
export PAGER=less
export TERM="xterm-256color"

### Plugin install
source "${HOME}/.zgen/zgen.zsh"

# If the init script doesn't exist
if ! zgen saved; then
  # Calculator inside the command line
  #zgen load arzzen/calc.plugin.zsh

  # oh-my-zsh
  zgen oh-my-zsh plugins/vi-mode
  zgen oh-my-zsh plugins/pass
  zgen oh-my-zsh plugins/systemd

  # Magnificent theme
  zgen load bhilburn/powerlevel9k powerlevel9k

  # Colors in the terminal
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

# Personnal theme for PowerLevel9k
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_INSTALLATION_PATH=/home/xorob0/.zgen/bhilburn/powerlevel9k-master/powerlevel9k.zsh-theme
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time vi_mode)
# POWERLEVEL9K_VI_INSERT_MODE_STRING=''
# POWERLEVEL9K_VI_INSERT_MODE_STRING='M'
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='034'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='254'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='031'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='254'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vcs context dir_writable dir)
#POWERLEVEL9K_DISABLE_RPROMPT=true
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


### Custom ZSH options

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
alias ll='ls -lhF --color=auto'
alias llt='ls -lht --color=auto'
alias lla='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias ls="ls --color=auto"
alias ldot="ls -ld .* --color=auto"

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

# End of line aliases
# alias H="| head"
# alias T="| tail"
# alias G="| grep"
# alias L="| less"
# alias NUL="> /dev/null 2>&1"

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

# Synchronize path with ranger
#alias ranger='ranger-cd'

# Some alias for backward directory
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

### Completion things

# Launch comletion module
autoload -Uz compinit

# Always put the cursor at the end
#setopt ALWAYS_TO_END

# Immediatelly inset first match
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

# Make special keys work with my setup
#source ~/.zkbd/xterm-termite-:0
#	[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
#	[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
#	[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" beginning-of-line
#	[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
#	[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
#	[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" end-of-line
#	[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
#	[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char
#	# Search in history frome current line command
#	[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" history-beginning-search-backward
#	[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" history-beginning-search-forward
#  autoload zkbd

bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

bindkey '^[[Z' reverse-menu-complete

 # search with up down                                                                     
bindkey '^[[A' history-beginning-search-backward
bindkey '^[OA' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey '^[OB' history-beginning-search-forward

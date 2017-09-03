### Exporting variables
export EDITOR="nvim"
export LANG="en_US.UTF-8"
export PAGER=most
export TERM="xterm-256color"

### Plugin install

source "${HOME}/.zgen/zgen.zsh"

# If the init scipt doesn't exist
if ! zgen saved; then

  # Calculator inside the commandline
  zgen load arzzen/calc.plugin.zsh

  # Magnificent theme
  zgen load bhilburn/powerlevel9k powerlevel9k

  # Send = git add, git commit and git push zgen load robertzk/send.zsh
  # Colors in the terminal
  zgen load chrissicool/zsh-256color

  # Highlight syntax
  zgen load zsh-users/zsh-syntax-highlighting

  # Generate the init script from plugins above
  zgen save
fi

### Configure plugins

# Personnal theme for PowerLevel9k
POWERLEVEL9K_INSTALLATION_PATH=/home/xorob0/.zgen/bhilburn/powerlevel9k-master/powerlevel9k.zsh-theme
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir)
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

# Colorized, list and dotfile with ls
alias ls='ls -hAl --color=always'

# Automatic sudo for pacman
alias pacman='sudo pacman'

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

bindkey '^[[Z' reverse-menu-complete


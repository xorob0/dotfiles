
### Plugin install

source "${HOME}/.zgen/zgen.zsh"

# If the init scipt doesn't exist
if ! zgen saved; then

  # Calculator inside the commandline
  zgen load arzzen/calc.plugin.zsh

  # Magnificent theme
  zgen load bhilburn/powerlevel9k powerlevel9k

  # Send = git add, git commit and git push
  zgen load robertzk/send.zsh

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
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='233'
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='254'
POWERLEVEL9K_DIR_HOME_BACKGROUND='031'
POWERLEVEL9K_DIR_HOME_FOREGROUND='254'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='031'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='254'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='031'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='254'

### Custom ZSH options

# Why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# Spell check commands!  (Sometimes annoying)
setopt CORRECT

# beeps are annoying
setopt NO_BEEP

# hows about arrays be awesome?  (that is, frew${cool}frew has frew surrounding all the variables, not just first and last
# setopt RC_EXPAND_PARAM

# Setting aliases

alias ls='ls -hAl --color=always'
alias pacman='sudo pacman'

# Faster! (?)
#zstyle ':completion::complete:*' use-cache 1

# Have the newer files last so I see them first
#zstyle ':completion:*' file-sort modification reverse

# color code completion!!!!  Wohoo!
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}



#{{{ History Stuff

# Where it gets saved
HISTFILE=~/.history

# Remember about a years worth of history (AWESOME)
SAVEHIST=1000
HISTSIZE=1000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"



setopt always_to_end
setopt auto_menu
setopt complete_in_word

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR

bindkey '^r' history-incremental-search-backward

setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
#autoload -U promptinit
#promptinit

# Set ls colors
#LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Exporting variables
export EDITOR="nvim"
export LANG="en_US.UTF-8"
export PAGER=most
export TERM='xterm-256color'

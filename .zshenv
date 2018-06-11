# Support for android studio sdk
export ANDROID_HOME=/opt/android-sdk

# No xdg dir
export XDG_DESKTOP_DIR=/dev/null

# Adding /urs/local/bin to the path
export PATH=/home/toum/.gem/ruby/2.5.0/bin:/usr/local/bin:$PATH

# Longer passwords generated by password store
export PASSWORD_STORE_GENERATED_LENGTH=40

###############################
### Backend wayland support ###
###############################
# Better compatibility with java windows
export _JAVA_AWT_WM_NONREPARENTING=1

#export GDK_BACKEND=wayland
#export QT_QPA_PLATFORM=eglfs
export CLUTTER_BACKEND=wayland
export SDL_VIDEODRIVER=wayland

#######################
### Keyboard config ###
#######################
# US layout
export XKB_DEFAULT_LAYOUT=us
# International variant
export XKB_DEFAULT_VARIANT=intl
# Caps lock as escape, escape as escape
export XKB_DEFAULT_OPTIONS=caps:escape
# Faster key repeat
export WLC_REPEAT_DELAY=200
export WLC_REPEAT_RATE=30
# dead ' + c = ç
export GTK_IM_MODULE=cedilla
export QT_IM_MODULE=cedilla

#########################
### Defaults programs ###
#########################
# NeoVim is the best editor !!!!
export EDITOR="nvim"
# Setting up pager
export PAGER="less"
# Support for 256 colors in the term
export TERM="xterm-256color"
# Default browser depend on the display type
if [ -n "$DISPLAY" ]; then
    export BROWSER=qutebrowser
else 
    export BROWSER=links
fi

# Defaults for nnn
export NNN_FALLBACK_OPENER=xdg-open
export NNN_DE_FILE_MANAGER=ranger

export XKB_DEFAULT_LAYOUT=fr
export XKB_DEFAULT_OPTIONS=caps:swapescape
export WLC_REPEAT_DELAY=200
export WLC_REPEAT_RATE=30
#export GDK_BACKEND=wayland
export QT_QPA_PLATFORM=eglfs
export CLUTTER_BACKEND=wayland
export SDL_VIDEODRIVER=wayland
xrdb ${HOME}/.Xresources
sway

export XKB_DEFAULT_LAYOUT=fr,gb
export XKB_DEFAULT_OPTIONS=caps:swapescape,grp:shift_caps_toggle
export WLC_REPEAT_DELAY=200
export WLC_REPEAT_RATE=30
#export GDK_BACKEND=wayland
export QT_QPA_PLATFORM=eglfs
export CLUTTER_BACKEND=wayland
export SDL_VIDEODRIVER=wayland
sway
xrdb ${HOME}/.Xresources

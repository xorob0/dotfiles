export GTK_IM_MODULE=cedilla 
export QT_IM_MODULE=cedilla
export ANDROID_HOME=/opt/android-sdk
export XDG_DESKTOP_DIR=/dev/null
export PATH=/usr/local/bin:$PATH
export PASSWORD_STORE_GENERATED_LENGTH=40

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	if [[ ! -a /tmp/xorgon ]]; then
		export XKB_DEFAULT_LAYOUT=us
		export XKB_DEFAULT_VARIANT=intl
		export XKB_DEFAULT_OPTIONS=caps:escape
		export WLC_REPEAT_DELAY=200
		export WLC_REPEAT_RATE=30
		#export GDK_BACKEND=wayland
		#export QT_QPA_PLATFORM=eglfs
		export CLUTTER_BACKEND=wayland
		export SDL_VIDEODRIVER=wayland
  		exec sway
  	else
		exec startx
	fi
fi

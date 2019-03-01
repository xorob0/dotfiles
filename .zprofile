if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	if [[ ! -a /tmp/xorgon ]]; then
		exec /usr/local/bin/sway
	else
		exec startx
	fi
fi

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	if [[ ! -a /tmp/xorgon ]]; then
		exec sway
	else
		exec startx
	fi
fi

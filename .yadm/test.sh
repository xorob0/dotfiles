#! /bin/bash

ls /usr/share/applications/
if [ "$(xdg-settings get default-web-browser)" = "org.qutebrowser.qutebrowser.desktop" ];then
	echo "✅ qutebrowser is the default browser"
else
	echo "❌ qutebrowser is not the default browser"
	echo "The default browser is still $(xdg-settings get default-web-browser)"
	exit 1
fi


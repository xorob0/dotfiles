#! /bin/bash

if [ "$(xdg-settings get default-web-browser)" = "org.qutebrowser.qutebrowser.desktop" ];then
	echo "✅ qutebrowser is the default browser"
else
	echo "❌ qutebrowser is not the default browser"
	exit 1
fi


#! /bin/bash

if [[ "$OSTYPE" =~ ^darwin.* ]]; then
	if [ -z "$(brew --version)" ];then
		echo "✅ brew is installed"
	else
		echo "❌ brew is not installed"
		exit 1
	fi
fi

if [[ "$OSTYPE" =~ ^linux.* ]]; then
	if [ "$(xdg-settings get default-web-browser)" = "org.qutebrowser.qutebrowser.desktop" ] || [ "$(xdg-settings get default-web-browser)" = "qutebrowser.desktop" ];then
		echo "✅ qutebrowser is the default browser"
	else
		echo "❌ qutebrowser is not the default browser"
		echo "The default browser is still $(xdg-settings get default-web-browser)"
		exit 1
	fi
fi

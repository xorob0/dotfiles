# My damn lightweight setup
This is the setup I use on my Dell XPS 15" 9560. I know I don't need a setup this lightweight but I like the simplicity of it.
What I need:
- A window manager
- A network manager
- A web browser
- A file manager
- An E-mail client
- An image viewer
- A video player
- An office suite
- A password manager

## The window manager
I prefer tiling WM with text config file for the simplicity. I am using sway which is a port of i3 for wayland, it is very lightweight and it has all the fonctionnalities I need. I still keep i3 with a similar config in case I need to run a program that don't like wayland.

## The network manager
I have 3 options: NetworkManager, ConnMan or Netctl. NetworkManager is pretty bulky and not easy to configure without a gui, ConnMan is far more lightweight but difficult to debug and I have had a lot of trouble with it. This is why I am going with Netctl, it is lightweight, easy to use from the terminal and is already installed with systemd.

## The web browser
I am using vim shortcut in the browser so I am limited to either a webkit browser or Firefox. I have tried a lot of webkit browser with vim-like keybinding but none of them give me the versatility Firefox offers me. I am using it with the following addons:
- [HTTPS Everywhere]{https://addons.mozilla.org/fr/firefox/addon/https-everywhere/}
- [PassFF]{https://addons.mozilla.org/fr/firefox/addon/passff/} (see below)
- [Send to MPV]{https://addons.mozilla.org/fr/firefox/addon/send-to-mpv-player/} (see below)
- [Tridactyl]{https://addons.mozilla.org/fr/firefox/addon/tridactyl-vim/}
- [uBlock origin]{https://addons.mozilla.org/fr/firefox/addon/ublock-origin/}
- [uMatrix]{https://addons.mozilla.org/fr/firefox/addon/umatrix/}

Some of these addons do not have a equivalent in the webkit world.

## The file manager
The best terminal based file managing solutions are nnn and ranger. nnn is more lightweight and faster but is really not easy to configure, this is why I use ranger for the moment.
It also offers a preview for almost all file types including images and videos, altough it is sometimes slow even more with the directory preload enabled and with some special directories like wrongly mounted SSHFS partitions.
Using [alexanderjeurissen/ranger_devicons]{https://github.com/alexanderjeurissen/ranger_devicons/} I can enable a file type icon.

## The E-mail client
For a terminal based solution I can go with neoMutt or aerc. I did not decide yet

## The image viewer
feh and sxiv are the first to come to my mind, they are both really fast but sxiv has less "useless" options like the ability to manage wallpaper. 

## The video player
I need to choose between MPlayer, VLC and mpv. MPlayer support less format than the other tow and VLC is not good to read certain file type. I an going with mpv.

## The office suite
Since openoffice is almost unmaintained I am going with libreoffice. It is pretty slow but it does everything and I need that for my studies.

## The password manager
I could have gone with the fast and versatile KeePass, with it's good integration eith most OS and lot of support. But I choosed Pass because it does everything I need and it's code is extremely simple which allow for a lot of customisations.

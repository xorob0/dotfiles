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
- HTTPS Everywhere
- PassFF (see below)
- Send to MPV
- Tridactyl
- uBlock origin
- uMatrix

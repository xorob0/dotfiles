# Dotfiles
My dotfiles, currently using sway on ArchLinux.

## Prerequisite 
You should install git:
```
sudo pacman -S git
```

## How to install
First clone all the dotfiles to `~/.Dotfiles`.
```
git clone https://github.com/xorob0/dotfiles ~/.Dotfiles
```
Then copy the dotfiles to your home directory
```
cp -r ~/.Dotfiles/* ~
```

## Programs

### Sway
#### Required dependencies
- i3pystatus


####Optional dependencies

- rxvt-unicode
- j4-dmenu-desktop
- firefox-nightly
- speedcrunch
- brightnessctl
- dunst
- libinput-gestures-setup

#### Install
Just place the config file in `~/.config/sway/`

### i3pystatus



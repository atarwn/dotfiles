Atarwn's niri dotfiles
----------------------

I'm lazy ass fuck so don't expect a magical script that will set everything up by itself.

# Images

<img width="1920" height="1080" alt="Screenshot from 2025-09-04 23-10-11" src="https://github.com/user-attachments/assets/1eb3b424-74fe-4890-a93d-28953784e42a" />

<img width="1920" height="1080" alt="Screenshot from 2025-09-04 23-10-33" src="https://github.com/user-attachments/assets/1761a14e-2a5f-4d41-b0a2-140b137540c0" />


# Deps

```
niri fuzzel iwd nwg-drawer foot hyprlock git base-devel
```

- **Niri**: Main WM
- **Fuzzel**, **iwd**: Used in some scripts
- **foot**: Default terminal
- **hyprlock**: Default lockscreen
- **nwg-drawer**: Cool program launcher
- **git**: Need to clone repos
- **base-devel**: Need to build from AUR

## Recs

```
mako yambar nwg-look swww
```

- **Mako**: Notifications daemon
- **Yambar**: just a bar, sometimes i need it
- **nwg-look**: Program to set gtk3/4 themes, icons and cursors
- **swww**: A Solution to your Wayland Wallpaper Woes 

## Opts

```
greetd gtkgreet cage elvish
```

- **greetd**, **gtkgreet**, **cage**: Minimalist greeter setup
- **elvish**: Cool shell

[Wallpaper](https://www.reddit.com/r/ChangedFurry/comments/q65dwt/edited_some_puro_art_made_by_shin_and_turned_it/)

p.s. Put it in ~/Pictures/Backgrounds

## Aur

```
catppuccin-cursors-mocha catppuccin-gtk-theme-mocha 
```

# Setup

Dotfiles
```
~> git clone https://github.com/atarwn/dotfiles --depth 1
...
~> mv dotfiles/* .config/
~> chmod +x .config/*.sh
```

Icons
```
~> git clone https://github.com/IgorFerreiraMoraes/ Mignon-icon-theme  --depth 1
...
~> bash ./Mignon-icon-theme/install.sh
```

Then set up GTK theme, icons and cursors trough nwg-look

# Greeter setup

Just figure it out by yourself or use something lame like gdm or sddm

```bash
~> cat /etc/greetd/config.toml 
[terminal]
# The VT to run the greeter on. Can be "next", "current" or a number
# designating the VT.
vt = 1

# The default session, also known as the greeter.
[default_session]

# `agreety` is the bundled agetty/login-lookalike. You can replace `/bin/sh`
# with whatever you want started, such as `sway`.
#command = "agreety --cmd /bin/sh"

command = "cage -sd gtkgreet"

# The user to run the command as. The privileges this user must have depends
# on the greeter. A graphical greeter may for example require the user to be
# in the `video` group.
#user = "greeter"
user = "at"
~> cat /etc/greetd/environments 
niri-session
~>
```

# Caution!

Change my username in the configurations (at) to yours. But I recommend reading the section below.

# WARNING!

I cannot guarantee that my configuration will work that well outside of my PC. Here, I have provided primitive guidance on how to do it. I strongly recommend that you configure everything by yourself:

[Catppuccin Ports](https://catppuccin.com/ports/)

[Mignon's pastel icon theme](github.com/IgorFerreiraMoraes/Mignon-icon-theme)


My CodeOSS setup uses the following decorative extensions:

[Catppuccin for VSCode](https://open-vsx.org/extension/Catppuccin/catppuccin-vsc)

[Material Product Icons](https://open-vsx.org/extension/PKief/material-product-icons)

# License

Refer to Catppuccin's license

#!/bin/bash

# Export the path to this directory for later use in the script
export LINKDOT=$PWD

# Check that the arch keyring is up to date.
sudo pacman -Sy archlinux-keyring
sudo pacman-key --init

# Install fonts and programs. Including HerbstluftWM, a terminal emulator
# App launcher, screenshot tool, pdf viewer, image viewer, and text editor.

sudo pacman -S go ttf-joypixels ttf-croscore noto-fonts-cjk noto-fonts \
            ttf-hack nextcloud-client ttf-linux-libertine rofi mpv \
            kitty kitty-terminfo dash gvim scrot htop arc-gtk-theme \
            firefox sxhkd zathura-pdf-mupdf libnotify xclip \
            diff-so-fancy gnome-keyring xfce4-notifyd xsel xdotool \
            xorg-server xorg-xinit xorg-xrdb xorg-xprop awesome \
            pulseaudio-alsa exa pavucontrol tmux bash-completion pamixer \
	    fff fd bat ripgrep httpie sxiv fzf wireguard-arch wireguard-tools

# Link dash to /bin/sh for performance boost.
# Then link several font config files for better font display.
sudo ln -sfT dash /usr/bin/sh
sudo ln -sf /etc/fonts/conf.avail/75-joypixels.conf /etc/fonts/conf.d/
sudo ln -sf /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/
sudo ln -sf /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/
sudo ln -sf /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d/

# Misc but important. The last disables mouse acceleration and can be removed.
sudo install -Dm 644 other/freetype2.sh /etc/profile.d/
sudo install -Dm 644 other/local.conf /etc/fonts/
sudo install -Dm 644 other/dashbinsh.hook /usr/share/libalpm/hooks/
sudo install -Dm 644 other/50-mouse-acceleration.conf /etc/X11/xorg.conf.d/

# Make some folders. Screenshots will go in the captures folder.
mkdir -p ~/.config ~/.builds ~/Images/Captures ~/Images/Wallpapers \
            $LINKDOT/config/mpd/playlists ~/Music ~/.config/awesome/themes

# Move provided wallpapers to the wallpapers folder
cp -r wallpapers/* ~/Images/Wallpapers

# Clone some yay goodness
git clone https://aur.archlinux.org/yay.git ~/.build/yay
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/horst3180/arc-icon-theme --depth 1 ~/.builds/arc-icon-theme
git clone https://github.com/alchemistswater/awesome-wm-nord-theme.git ~/.config/awesome/themes/nord

# Install them
cd ~/.builds/yay
makepkg -si

yay -S picom bitwarden bitwarden-rofi youtube-dl pfetch-git \
            ckb-next kube moka-icon-theme lxappearance \
	    sox imagemagick i3lock canto-curses musikcube \
            profile-sync-daemon ttf-font-awesome mullvad-vpn

cd ~/.builds/arc-icon-theme
./autogen.sh --prefix=/usr
sudo make install

cd ~

read -p "-- Install gaming goodness? May take a minute. [y/N] " yna
case $yna in
            [Yy]* ) yay -S steam steam-native-runtime lib32-libpulse \
		    lib32-alsa-plugins \
                    lutris lutris-wine-meta itch
                    ;;
                        * ) echo "-- skipping";;
esac

read -p "-- Install communication goodness? May take a minute. [y/N] " yna
case $yna in
            [Yy]* ) yay -S finch aspell-en telegram-desktop \
		    purple-gnome-keyring cordless-git
                    ;;
                        * ) echo "-- skipping";;
esac

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# Link all dotfiles into their appropriate locations
cd ~
ln -sf $LINKDOT/home/.* /home/$USER/

cd ~/.config
ln -sf $LINKDOT/config/* /home/$USER/.config/

cd /usr/bin
sudo ln -sf $LINKDOT/scripts/* /usr/bin/

sudo systemctl enable ckb-next-daemon
systemctl --user enable psd

cd ~
#curl "https://raw.githubusercontent.com/dylanaraps/promptless/master/install.sh" | sh

su -c 'cat > /usr/share/dbus-1/services/org.freedesktop.Notifications.service << "EOF"
[D-BUS Service]
Name=org.freedesktop.Notifications
Exec=/usr/lib/xfce4/notifyd/xfce4-notifyd
EOF'

echo "-- Installation Complete! Restart the computer."

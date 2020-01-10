### A stylish setup that's ready for work in minutes.

### Introduction 

As per usual, I stole this shit from https://github.com/tonijarjour/autorice then modified the crap out of it. All credit goes to them, I just made it work for me.

Programs have been chosen at random based on other peoples skill and knowledge. At the same time, probably too many are included. To keep it lean, command line tools make up the majority of what you will be getting. It's up to you to install the rest. 

**Default programs**

* **Window Manager**: herbstluftwm
* **Terminal**: Kitty
* **Status Bar**: Polybar
* **Shell**: bash/promptless 
* **App Launcher**: Rofi
* **System Info**: pfetch
* **Text Editor**: gvim
* **Hotkey Daemon**: sxhkd
* **Notifications**: xfce4-notifyd
* **PDF Reader**: zathura
* **Screenshot Tool**: scrot
* **Image Viewer**: feh
* **Video Player**: mpv
* **Music Player**: mpd/ncmpcpp
* **ls**: exa 
* **Fuzzy Search**: fzf
* **File Manager**: fff
* **Image Viewer**: feh
* **Music Daemon**: mpd
* **Music Player**: ncmpcpp
* **find**: fd
* **grep**: ripgrep
* **curl**: httpie
* **cat**: bat

### Installation

This little script will install a collection of command line tools, a window manager, and a terminal emulator. Installation is easy:

1. Install Arch Linux and make sure you have `base-devel` and `git` packages.
2. `git clone https://github.com/alchemistswater/quickrice`
3. `cd quickrice` (You **must** be inside the cloned directory)
4. `sh setup.sh`
5. Restart your computer after the script finishes.

### Usage

This script does nothing past providing you with dotfiles for the programs it installs. There is no universal config file, nor a master settings panel. Its up to you to configure and learn everything you need.

With that said. There are some important aspects that should give some comfort:

1. Everything is *nearly* default. 
2. No magic. The dotfiles are organized in the simplest and most logical structure possible. 
3. Theres not much here. You can look through everything in about an hour. 

With those three points laid out, here are some basic keybindings to help you out:

**Global**

* `mod return` to start a Terminal.
* `mod d` to use the app launcher.
* `mod shift d` to open rofi-pass
* `mod h,j,k,l` to move between windows.
* `mod 1,2,3...` to move between workspaces.
* `mod shift h,j,k,l` to swap window positions.
* `mod shift 1,2,3...` to send a window to a workspace.
* `mod alt w` to load a new random wallpaper.
* `mod printscreen` to select an area to capture. 
* `printscreen` to take a screenshot.
* `mod left click` to move a floating window.
* `mod right click` to resize windows.
* `mod escape` to reload the hotkey config.

### Something doesn't work. 

**Please** open an issue and tell me what happened. My goal is to make this work for everyone and that starts with fixing every little problem people have.


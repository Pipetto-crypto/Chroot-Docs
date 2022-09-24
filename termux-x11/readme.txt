Use this guide to install Termux-X11:

https://udroid-rc.gitbook.io/udroid-wiki/udroid-landing/quick-installation-and-usage/setting-up-gui/termux-x11

Here you can find the script I use in the chroot to start the Xwayland server and eventually start a desktop environment, lxqt in my case. It requires to have Xwayland installed in the chroot (sudo apt install xwayland, only tested with 1.20.11 version)

This script will be installed in the chroot the moment you run the -w option for the first time (linux-deploy start -w)

Refer to this and modify it in /usr/bin/termux-x11 according to your setup, for example if you use a different DE compared to lxqt.

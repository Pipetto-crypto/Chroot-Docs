Use this guide to install Termux-X11:

https://udroid-rc.gitbook.io/udroid-wiki/udroid-landing/quick-installation-and-usage/setting-up-gui/termux-x11

In the chroot, install Xwayland with apt ( sudo apt install Xwayland ) then to start the Xwayland server launch the chroot with the -w option ( linux deploy start -w)

The first time you use the -w option, it will install the script you can find here in /usr/bin. You are free to modify it according to your needs

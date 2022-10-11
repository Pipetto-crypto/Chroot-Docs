Use this guide to install Termux-X11 but pay attention to some of the steps highlighted here:

https://udroid-rc.gitbook.io/udroid-wiki/udroid-landing/quick-installation-and-usage/setting-up-gui/termux-x11

termux-x11 package seems to have been removed from the x11-repo so don't need to install it with pkg anymore, just installing the deb with dpkg should be enough. Follow the rest of the guide up to the "Setting termux is done" line.

In the chroot and not in termux, install Xwayland with apt ( sudo apt install Xwayland ) then to start the Xwayland server launch the chroot with the -w option ( linux deploy start -w)

The first time you use the -w option, it will install the script you can find here in /usr/bin. You are free to modify it according to your needs

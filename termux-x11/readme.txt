The script here is the one used in the chroot to start the Xwayland server and eventually start a desktop environment, lxqt in my case. It requires to have Xwayland installed in the chroot (sudo apt install xwayland)

This script will be installed in the chroot the moment you run the -w option for the first time (linux-deploy start -w)

Refer to this and modify it in /usr/bin/termux-x11 according to your setup

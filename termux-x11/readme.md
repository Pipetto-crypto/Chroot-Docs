# INSTALLATION

## CHROOT

Use this guide to install Termux-X11 but pay attention to some of the steps highlighted here:

https://udroid-rc.gitbook.io/udroid-wiki/udroid-landing/quick-installation-and-usage/setting-up-gui/termux-x11

termux-x11 package seems to have been removed from the x11-repo so don't need to install it with pkg anymore, just installing the deb with dpkg should be enough. Follow the rest of the guide up to the "Setting termux is done" line.

In the chroot and not in termux, install Xwayland with apt ( sudo apt install Xwayland ) and you will also need to create the XDG_RUNTIME_DIR folder by pasting these commands:

sudo mkdir -p /tmp/runtime-android

sudo chown android:android /tmp/runtime-android

sudo chmod 755 /tmp/runtime-android

If android isn't your username, change it accordingly. Exit the chroot and if you have used the script here to run it you need to stop it as well (linux-deploy stop).

To start the Xwayland server now, launch the chroot with the -w option ( linux deploy start -w). At one point, it will launch the termux-x11 app where you need to wait up until the toast "Service was created" appears then you can leave.

Inside the chroot paste this command to start the Xwayland server:

taskset -c 4-7 Xwayland :0 &



## PROOT

Follow all the steps above up to the point where it tells you to start the xwayland server. Launch your proot with the --shared-tmp option( proot-distro login debian --shared-tmp) then from another terminal window run the command:

termux-x11

Once the termux-x11 opens and the toast "Service was created" appears go back into termux and inside the proot type the command "Xwayland :0 -noreset &". Now the tricky part is that this may hang and you will be required to close termux-x11 from the notification, exit the proot and retry. To see if it worked after the Xwayland command you will see a similiar output:

"The XKEYBOARD keymap compiler (xkbcomp) reports:
> Warning:          Unsupported maximum keycode 569, clipping.
>                   X11 cannot support keycodes above 255.
Errors from xkbcomp are not fatal to the X server"

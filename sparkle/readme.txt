To use Sparkle, first install the apk there and launch the app. Tap on EDIT USER.SH and delete everything you find there then start the server. It requires to have Xwayland and weston installed in the chroot (sudo apt install xwayland weston)

Use the -s option to start the Xwayland server in the chroot and start lxqt  (linux-deploy start -s)

The script you see here and that it will be automatically installed in the chroot when you use the -s option for the first time tries to launch lxqt. If you are using a different desktop environment than lxqt, modify the script in /usr/bin/sparkle accordingly.

 




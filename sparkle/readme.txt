To use Sparkle, first install the apk there and launch the app. Tap on EDIT USER.SH and delete everything you find there before starting the server. It requires to have Xwayland and weston installed in the chroot (sudo apt install xwayland weston)

Use the -s option (linux-deploy start -s) to start the Xwayland server in the chroot through the script you can find here and that will be installed the first time you use the -s option. By default this script will also launch a lxqt session because that's what I am using in my setup.

If you are using a different desktop environment than lxqt, modify the script in /usr/bin/sparkle accordingly.

 




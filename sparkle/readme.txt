To use Sparkle, first install the apk here and launch the app. Tap on EDIT USER.SH and delete everything you find there before starting the server. It requires to have Xwayland and weston installed in the chroot (sudo apt install xwayland weston)

Use the -s option (linux-deploy start -s) to start the Xwayland server in the chroot through the script you can find here which will be installed the first time you use the -s option.

You can customize this script by editing the /user/bin/sparkle file


 




# INSTALLATION

After you have installed a desktop environment of your choice, to get vnc working install the following packages:

sudo apt install tigervnc-standalone-server tigervnc-common tigervnc-xorg-extension

You will have to create a xstartup file inside the .vnc folder:

nano .vnc/xstartup

Paste the following lines now, these will work for lxqt but minimal modifications will need to be done to get other desktop environments to work:

unset SESSION_MANAGER

unset DBUS_SESSION_BUS_ADDRESS

exec dbus-launch --exit-with-session startlxqt 

[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup

[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources

xsetroot -solid grey

vnconfig -iconic &

After pasting these close and save nano editor (CTRL+O then CTRL+X).

To start the vnc server, type the command 'vncserver :0'. It will ask you to enter a password the first time.


# CONNECTION


You can use a client like VNC Viewer to access it by filling the fields like this:

Address: localhost:5900
Name: "Here you can put whatever you want"

#!/bin/bash

sudo apt install tigervnc-standalone-server tigervnc-common dbus-x11 tigervnc-xorg-extension icewm -y
mkdir -p $HOME/.vnc
touch $HOME/.vnc/xstartup
sudo chmod +x $HOME/.vnc/xstartup
echo "unset SESSION_MANAGER" >> $HOME/.vnc/xstartup
echo "unset DBUS_SESSION_BUS_ADDRESS" >> $HOME/.vnc/xstartup
echo "exec dbus-launch --exit-with-session icewm" >> $HOME/.vnc/xstartup
echo "[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup" >> $HOME/.vnc/xstartup
echo "[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources" >> $HOME/.vnc/xstartup
echo "xsetroot -solid grey" >> $HOME/.vnc/xstartup
echo "vncconfig -iconic &" >> $HOME/.vnc/xstartup

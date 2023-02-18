#!/bin/bash

DEPLOY=/data/user/0/ru.meefik.linuxdeploy/files/bin/linuxdeploy
CHROOT_DIR=/data/local/mnt
A_VERSION=$(getprop ro.build.version.release)

echo -e "Installing all dependencies and setting up storage permissions"

pkg update
pkg install x11-repo root-repo -y
pkg install pulseaudio bindfs tsu openssh openssl xwayland megatools git wget -y

if [ ! -d ~/storage ]
then
	termux-setup-storage
fi

echo -e "Cloning the repo"

git clone https://github.com/Pipetto-crypto/Chroot-Docs.git
cd Chroot-Docs

echo -e "\nDownloading the rootfs"


if [ ! -f /sdcard/debian.tar.bz2 ]
then
	megadl https://mega.nz/file/cV5ClJrb#h5UvcIdiLq2zFncGYBe3lBL3QjauJFmLupu2faKvFUY --path=/sdcard
fi
echo -e "\nPreparing LinuxDeploy config"

read -p "Select an username: " USRNAME
read -p "Select a password: " PASSWD
read -p "Select a path and imgname(e.g.,/sdcard/linux.img): " INSPATH
read -p "Select img size in MBs(recommended >= 8192): " DISKSZE

cp setup/linux.conf .

sed -i "s/disksize/$DISKSZE/g" linux.conf
sed -i "s/yourpasswd/$PASSWD/g" linux.conf
sed -i "s/yourusrname/$USRNAME/g" linux.conf
sed -i "s|installpath|$INSPATH|g" linux.conf

echo -e "\nInstalling Linux Deploy app"

wget https://github.com/meefik/linuxdeploy/releases/download/2.6.0/linuxdeploy-2.6.0-259.apk
sudo pm install linuxdeploy-2.6.0-259.apk
sudo rm -rf linuxdeploy-2.6.0-259.apk

if (( $(echo "$A_VERSION >= 11"|bc -l) ))
then
    echo -e "I detected you are running Android 11 or newer which makes this script unlikely to work because of scoped storage restrictions. Attempting to fix, can't guarantee it will work"
    su -c cmd appops set ru.meefik.linuxdeploy android:legacy_storage allow
fi

echo -e "\nCopying config"

sudo mv linux.conf /data/user/0/ru.meefik.linuxdeploy/files/config

echo -e "\nInstalling Termux-X11"

if ! grep -qF "allow-external-apps = true" ~/.termux/termux.properties
then
	echo 'allow-external-apps = true' >> ~/.termux/termux.properties
fi
termux-reload-settings
cp termux-x11/termux-x11.zip .
unzip termux-x11.zip
dpkg -i --force-depends termux-x11.deb
sudo pm install app-debug.apk
sudo rm -rf termux-x11.zip app-debug.apk output-metadata.json termux-x11.deb

echo -e "\nStarting installation"

sudo $DEPLOY deploy

echo -e "\n Mounting container"

sudo $DEPLOY start -m

echo -e "\n Copying installation scripts and required files to the chroot"

sudo mkdir -p $CHROOT_DIR/home/$USRNAME/scripts
sudo cp setup/*.sh $CHROOT_DIR/home/$USRNAME/scripts
sudo chmod a+rwx $CHROOT_DIR/home/$USRNAME/scripts/*

echo -e "\n Installing required dependencies"

sudo $DEPLOY shell -u $USRNAME sudo apt update
sudo $DEPLOY shell -u $USRNAME "sudo apt install xwayland wget gnupg2 -y"

echo -e "\n Appending important env variables to profile and setting bash as the main shell"

sudo $DEPLOY shell -u $USRNAME bash /home/$USRNAME/scripts/setup_env.sh

echo -e "\n Installing vnc and icewm"

sudo $DEPLOY shell -u $USRNAME bash /home/$USRNAME/scripts/install_vnc.sh

echo -e "\n Installing box64 and box86"

sudo $DEPLOY shell -u $USRNAME bash /home/$USRNAME/scripts/install_box.sh

if [ -d /proc/sys/fs/binfmt_misc ]
then

		echo -e "\n Installing binfmt entries"

		sudo $DEPLOY shell -u $USRNAME "sudo apt install binfmt-support -y"
		sudo cp binfmt-confs/box86 binfmt-confs/box64  $CHROOT_DIR/usr/share/binfmts

fi

echo -e "\n First setup completed, stopping the chroot"

sudo $DEPLOY stop -u

echo -e "\n Copying the linux-deploy wrapper script"

cp linux-deploy $PATH
chmod +x $PATH/linux-deploy

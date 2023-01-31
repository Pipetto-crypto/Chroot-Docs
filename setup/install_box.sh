#!/bin/bash

echo -e "Adding armhf architechture"

sudo dpkg --add-architecture armhf
sudo apt update

echo -e "Installing required dependencies dependencies"

sudo apt install zenity:armhf libasound*:armhf libstdc++6:armhf mesa*:armhf -y
sudo apt install mesa-* zenity-* wget gcc-multilib-x86-64-linux-gnu gnupg2 -y

echo -e "Installing box86 and box64"

sudo wget https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list
wget -qO- https://ryanfortner.github.io/box64-debs/KEY.gpg | sudo apt-key add -
sudo apt update && sudo apt install box64 -y
sudo wget https://itai-nelken.github.io/weekly-box86-debs/debian/box86.list -O /etc/apt/sources.list.d/box86.list
wget -qO- https://itai-nelken.github.io/weekly-box86-debs/debian/KEY.gpg | sudo apt-key add -
sudo apt update && sudo apt install box86 -y
sudo ln /usr/local/bin/box86 /usr/bin/box86
sudo ln /usr/local/bin/box64 /usr/bin/box64

echo -e "Installing wine64 and wine"

mkdir -p $HOME/wine
mkdir -p $HOME/wine64
wget http://www.playonlinux.com/wine/binaries/phoenicis/upstream-linux-x86/PlayOnLinux-wine-7.0-rc1-upstream-linux-x86.tar.gz
wget http://www.playonlinux.com/wine/binaries/phoenicis/upstream-linux-amd64/PlayOnLinux-wine-6.14-upstream-linux-amd64.tar.gz
tar -xzvf PlayOnLinux-wine-7.0-rc1-upstream-linux-x86.tar.gz -C wine
tar -xzvf PlayOnLinux-wine-6.14-upstream-linux-amd64.tar.gz -C wine64
echo "alias win32='WINEPREFIX=~/.wine32 WINEARCH=win32'" >> $HOME/.bashrc
echo "export PATH=$PATH:~/wine/bin:~/wine64/bin" >> $HOME/.bashrc

echo -e "Installing bash_x86 and bash_x64"

wget https://github.com/Pipetto-crypto/Chroot-Docs/raw/main/box-wine/bash_x64
wget https://github.com/Pipetto-crypto/Chroot-Docs/raw/main/box-wine/bash_x86
mkdir -p $HOME/box_bash
sudo chmod +x bash_x64 bash_x86
mv bash_x64 $HOME/box_bash
mv bash_x86 $HOME/box_bash


echo -e "Installing winetricks"

wget https://raw.githubusercontent.com/Pipetto-crypto/Chroot-Docs/main/box-wine/winetricks
sudo mv winetricks /usr/bin
sudo chmod +x /usr/bin/winetricks

echo -e "Cleaning up"

sudo rm -rf *.tar.gz


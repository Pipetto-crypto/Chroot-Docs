Collection of scripts, docs that I used to setup my chroot. These docs will assume the following:

1. You have this repo somewhere downloaded and extracted in your device.

2. You are using Debian though Ubuntu may work as well for most part.

3. You are using a chroot and you are launching it with the linux-deploy script though most of the instructions here will work with any setup. 

Generally you can just look at the linux-deploy script, see what each section does and copy the commands in termux yourself. For example to get pulseaudio working, paste these in termux before starting the proot/chroot:

pulseaudio --start --exit-idle-time=-1

pacmd load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1

Also, in some cases I have left some specific proot installation instructions in a few of the docs here

# Installation

Download Linux-Deploy from PlayStore and the rootfs from here:  https://mega.nz/file/cV5ClJrb#h5UvcIdiLq2zFncGYBe3lBL3QjauJFmLupu2faKvFUY

In Linux Deploy, tap the icon with the three sliders(the one next to the stop button) and make sure you set the following options like this:

Distribution: rootfs

Installation Type: File

Source path: the path where you have stored the rootfs (/sdcard/path_to_rootfs/debian.tar.bz2)

SSH: Enable

PulseAudio: Enable --> Audio Settings/Port delete whatever is written there and leave it blank

Configure USER PASSWORD, USER NAME, IMAGE SIZE, LOCALIZATION to your likes. Don't touch MOUNTS and GUI options, the linux-deploy script in this repo handles them itself. Once you are done configuring everything, go back and tap on the three dots icon and press install.

Once it finishes installing, open Termux and after giving executable permission to the linux-deploy script in the root of this repo move it to your $PATH: cp path_to_linux-deploy_script $PATH


Before you can run the chroot, you are required to install these dependecies in Termux:

pkg install root-repo
pkg install pulseaudio bindfs tsu openssh openssl

To run the chroot, you just need to execute the script like this: linux-deploy start , running the script without any option will print a help screen. 

The first time you enter the chroot, you will have to append these lines to your /etc/profile

export DISPLAY=:0

export PULSE_SERVER=127.0.0.1

export XDG_RUNTIME_DIR=/tmp/runtime-yourchrootusername

Remember that if you set an user different than android, you are required to change all the recurrences of android in the linux-deploy script as well.

# Sections

box-wine - contains the box86 and 64 binaries and a guide on how to install them

termux-x11 - contains instructions on how to install termux-x11

sparkle - contains instructions on how to install sparkle xwayland server, sometimes faster than termux-x11 but generally not recommended

vnc - contains instructions on how to install vnc server

videos - contains brief showcases about how the chroot work. 

# Recommendations

1. Install the linux image in your internal storage, I noticed that this gives a sizeable boost in speed

2. Use a lightweight Desktop Environment like lxqt: sudo apt install lxqt

3. Run wine with winedesktop ( win32 taskset -c 4-7 box86 wine explorer /desktop=shell,1920x1080 explorer.exe . for wine32) 

4. If you can, try to use Termux-x11 since it will offer you the smoothest experience

5. If you can't get a chroot for various reasons, you can fall back to using a proot. I recommend proot-distro package in termux. It's very easy to use so no instructions will be provided here

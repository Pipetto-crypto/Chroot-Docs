# INSTALLATION



Get the box86 and box64 executables you find here, log into your chroot/proot and copy the two executables you downloaded in /usr/bin: 

sudo chmod a+x path_to_box86/box86

sudo cp path_to_box86/box86 /usr/bin

sudo chmod a+x path_to_box64/box64 

sudo cp path_to_box64/box64 /usr/bin


Add armhf foreign architecture: sudo dpkg --add-architecture armhf

Afer running sudo apt update, download box86 and box64 dependencies:

sudo apt install zenity:armhf libasound*:armhf libstdc++6:armhf mesa*:armhf #box86 dependencies

sudo apt install mesa* zenity* #box64 dependencies

While you are in your home directory, create these two directories:

mkdir wine

mkdir wine64

Download wine binaries: wget http://www.playonlinux.com/wine/binaries/phoenicis/upstream-linux-x86/PlayOnLinux-wine-7.0-rc1-upstream-linux-x86.tar.gz

Download wine64 binaries: wget  http://www.playonlinux.com/wine/binaries/phoenicis/upstream-linux-amd64/PlayOnLinux-wine-6.14-upstream-linux-amd64.tar.gz

Extract both wine and wine64 in those two folders you had created before:

tar -xzvf PlayOnLinux-wine-7.0-rc1-upstream-linux-x86.tar.gz -C wine

tar -xzvf PlayOnLinux-wine-6.14-upstream-linux-amd64.tar.gz -C wine64

Add these lines to your /etc/profile:

export BOX86_PATH=~/wine/bin/

export BOX86_LD_LIBRARY_PATH=~/wine/lib/wine/i386-unix/:/lib/i386-linux-gnu:/lib/aarch64-linux-gnu/

export BOX64_PATH=~/wine64/bin/

export BOX64_LD_LIBRARY_PATH=~ /wine64/lib/i386-unix/: ~/wine64/lib/wine/x86_64-unix/:/lib/i386-linux-gnu/:/lib/x86_64-linux-gnu:/lib/aarch64-linux-gnu/ (spaces between ~ and / will need to be removed like the spaces between : and ~)

To make the changes effective, type the command 'source /etc/profile'. You can run 32bit programs with 'box86 wine name.exe' and 64bit ones with 'box64 wine64 name.exe' command. Remember that you can run either 32bit or 64bit at a time and if you want to switch you will have to delete your prefix.

To run wine32 without always deleting the prefix, append these lines to your .bashrc(spaces between ~ and / will need to be removed like spaces between : and ~):

export PATH=~ /wine/bin/: ~/wine64/bin/:$PATH

alias win32='WINEPREFIX=~/.wine32 WINEARCH=win32'

Type the command 'source .bashrc' to make the change effectives then to create a wine32 prefix run 'win32 wine winecfg' command in terminal, everytime you want to run a win32 app type 'win32 box86 wine programname.exe'.


# x86 and x64 BASH


Since it is hard to get binfmt support in Android, after a recent box86/64 update it is possible to use an alternative for it:

Make sure you have downloaded the latest executable of box86 and box64 you can find here then download bash_x86 and bash_x64 from here and put them in a folder in your home directory, and after giving them executable permission, in your /etc/profile add the following lines:

export BOX86_BASH=pathtobashx86/bash_x86
export BOX64_BASH=pathtobashx64/bash_x64

Type the command 'source /etc/profile' to make the changes effective in the current session. Now it should be possible to run stuffs like winetricks without binfmt_misc.

# WINETRICKS

Move the executable you find here into /use/bin and give it executable permission:

sudo mv pathtowinetricks/winetricks /usr/bin

sudo chmod +x /usr/bin/winetricks

When you want to execute winetricks, run the following command 'win32 box64 winetricks'

# CREDITS


Some parts of this guide have been taken from here:  

https://github.com/fengxue-jrql/box86-and-box64-for-arm64/blob/main/How%20to%20set%20the%20environment

https://box86.org/2022/09/running-bash-with-box86-box64/

#!/bin/bash

echo "export BOX86_PATH=~/wine/bin/" | sudo tee -a /etc/profile >/dev/null 2>&1
echo "export BOX86_LD_LIBRARY_PATH=~/wine/lib/wine/i386-unix/:/lib/i386-linux-gnu:/lib/aarch64-linux-gnu/" | sudo tee -a /etc/profile >/dev/null 2>&1
echo "export BOX64_PATH=~/wine64/bin/" | sudo tee -a /etc/profile >/dev/null 2>&1
echo "export BOX64_LD_LIBRARY_PATH=~/wine64/lib/wine/i386-unix/:~/wine64/lib/wine/x86_64-unix/:/lib/i386-linux-gnu/:/lib/x86_64-linux-gnu:/lib/aarch64-linux-gnu:/usr/x86_64-linux-gnu/lib/" | sudo tee -a /etc/profile >/dev/null 2>&1
echo "export DISPLAY=:0" | sudo tee -a /etc/profile >/dev/null 2>&1
echo "export PULSE_SERVER=127.0.0.1" | sudo tee -a /etc/profile >/dev/null 2>&1
echo "export XDG_RUNTIME_DIR=/tmp/runtime-$USER" | sudo tee -a /etc/profile >/dev/null 2>&1
echo "export BOX86_BASH=$HOME/box_bash/bash_x86" | sudo tee -a /etc/profile >/dev/null 2>&1
echo "export BOX64_BASH=$HOME/box_bash/bash_x64" | sudo tee -a /etc/profile >/dev/null 2>&1
sudo sed -i "s/\/sh/\/bash/g" /etc/passwd

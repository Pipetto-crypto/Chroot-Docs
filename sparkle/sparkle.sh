#!/bin/bash
set -e 
sudo chmod 777 /sparkle
sudo chmod 777 /sparkle/wayland-0
XDG_RUNTIME_DIR=/sparkle taskset -c 4-7 Xwayland &
sleep 1



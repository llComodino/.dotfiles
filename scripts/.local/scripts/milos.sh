#!/usr/bin/env bash

if pgrep -x "asusctl" > /dev/null
then
  pkill asusctl
  asusctl anime -e false
else
  asusctl anime gif -p ~/pictures/anime_matrix/gifs/milos.gif -l 0 -a 0.785 -y 0.4 -x 0.4 &
fi

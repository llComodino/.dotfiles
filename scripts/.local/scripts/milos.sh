#!/usr/bin/env bash

if pgrep -x "asusctl" > /dev/null
then
  pkill asusctl
  asusctl anime -e false
else
  gifs=$(find ~/pictures/anime_matrix/ -name "*.gif" -type f)

  # create an array of the base names of the gifs
  basename_gifs=()
  while IFS= read -r gif; do
    basename_gif=$(basename "$gif")
    basename_gifs+=("$basename_gif")
  done <<< "$gifs"

  selected_gif=$(echo "${basename_gifs[@]}" | tr ' ' '\n' | rofi \
    -dmenu -theme "$HOME/.config/rofi/launchers/type-6/style-10.rasi" \
    -i -p "Select a GIF")
  if [ -z "$selected_gif" ]; then
    return 1
  fi

  selected_gif=$(find ~/pictures/anime_matrix/ -name "$selected_gif" -type f)

  if [[ "$selected_gif" == *"milos.gif"* ]]; then
    asusctl anime gif -p ~/pictures/anime_matrix/gifs/milos.gif -l 0 -a 0.785 -y 0.4 -x 0.4 &
  else
    asusctl anime gif -p "$selected_gif" -l 0
  fi
fi

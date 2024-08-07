#!/usr/bin/env bash

if [ -z "$XDG_PICTURES_DIR" ]; then
  XDG_PICTURES_DIR="$HOME/pictures"
fi

swpy_dir="$HOME/.config/swappy"
save_dir="${2:-$XDG_PICTURES_DIR}"
save_file=$(date +'%y%m%d_%Hh%Mm%Ss_screenshot.png')
mkdir -p "$save_dir"

case $1 in
  p) grim "$save_dir/$save_file" ;;

  s)
    mkdir -p "$swpy_dir"
    echo -e "[Default]\nsave_dir=$save_dir\nsave_filename_format=$save_file" >"$swpy_dir/config"
    grim -g "$(slurp)" - | swappy -f -
  ;;

  *)
    echo "...valid options are..."
    echo "p : print screen to $save_dir"
    echo "s : snip current screen to $save_dir"
    exit 1
  ;;
esac

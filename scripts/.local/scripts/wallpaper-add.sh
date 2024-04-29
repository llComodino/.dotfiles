#!/usr/bin/env bash

[[ -z $1 ]] && echo "Usage: $(basename $0) <wallpaper>" && exit 1
[[ ! -f $1 ]] && echo "File not found: $1" && exit 1

if [[ $(file --mime-type -b $1 | grep -q image) ]]; then
  echo "Not an image: $1" && exit 1
fi

for dir in $(find $HOME/.config/swww/ -mindepth 1 -maxdepth 1 -type d); do

  [[ -f $dir/$(basename $1) ]] && echo "File already exists: $dir/$(basename $1)" && continue

  echo "Copying $1 to $dir"
  cp $1 $dir

done

#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/.wallpapers"
THUMBS_DIR="$WALLPAPER_DIR/thumbs"
WALLPAPER_LIST=$(mktemp)
ROFI_THEME="$HOME/.config/rofi/wallpaper-select.rasi"

[[ ! -d "$WALLPAPER_DIR" ]] && exit 1

for file in "$THUMBS_DIR"/*; do
  if [[ $file == *.jpg || $file == *.png || $file == *.jpeg || $file == *.bmp ]]; then
      echo -e "$file\x00icon\x1f$file" >> "$WALLPAPER_LIST"
  fi
done

[[ ! -s "$WALLPAPER_LIST" ]] && echo "No wallpapers found in: $WALLPAPER_DIR" && exit 1

selected_wallpaper=$(rofi -dmenu -i -p "Select Wallpaper" -theme "$ROFI_THEME" < "$WALLPAPER_LIST")

if [ -n "$selected_wallpaper" ]; then
  selected_wallpaper=${selected_wallpaper/\/thumbs/}
  rm "$WALLPAPER_DIR/active"
  ln -s "$selected_wallpaper" "$WALLPAPER_DIR/active"
  swww img "$WALLPAPER_DIR/active"
fi

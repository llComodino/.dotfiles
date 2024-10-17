#!/usr/bin/env bash

# set variables
themes_dir="$HOME/.themes"
rofi_conf="$HOME/.config/rofi/theme.rasi"

r_override="element{border-radius:30px;} element-icon{border-radius:30px;size:200px;}"

theme_selected=$(for img in "$themes_dir"/*/metacity-1/thumbnail.png; do
  theme_name="$img"
  echo -en "$theme_name\x00icon\x1f$img\n"
done | rofi -dmenu -theme-str "${r_override}" -config "$rofi_conf")

if [ -n "$theme_selected" ]; then
  "$SCRIPTS/themeswitch.sh" -s "$theme_selected"
fi

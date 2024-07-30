#!/usr/bin/env bash

# set variables
ThemeSet="$HOME/.config/hypr/themes/theme.conf"
RofiConf="$HOME/.config/rofi/themeselect.rasi"
RofiStyle="$HOME/.config/rofi/styles"
Rofilaunch="$HOME/.config/rofi/config.rasi"

# scale for monitor x res
x_monres=$(cat /sys/class/drm/*/modes | head -1 | cut -d 'x' -f 1)
x_monres=$((x_monres * 18 / 100))

# set rofi override
hypr_border=$(awk -F '=' '{if($1~" rounding ") print $2}' "$ThemeSet" | sed 's/ //g')
elem_border=$((hypr_border * 5))
icon_border=$((elem_border - 5))
r_override="listview{columns:4;} element{orientation:vertical;border-radius:${elem_border}px;} element-icon{border-radius:${icon_border}px;size:${x_monres}px;} element-text{enabled:false;}"

# launch rofi menu
RofiSel=$(find "$RofiStyle" -name "style_*.rasi" | awk -F '/' '{print $NF}' | cut -d '.' -f 1 | while read -r rstyle; do
  echo -en "$rstyle\x00icon\x1f$RofiStyle/${rstyle}.png\n"
done | rofi -dmenu -theme-str "${r_override}" -config "$RofiConf")

# apply rofi style
if [[ -n "$RofiSel" ]]; then
  cp "$RofiStyle"/"$RofiSel".rasi "$Rofilaunch"
fi

#!/usr/bin/env bash

function get_brightness {
  brightnessctl -m | grep -o '[0-9]\+%' | head -c-2
}

case $1 in
i)
  brightnessctl set +5%
  ;;
d)
  if [[ $(get_brightness) -lt 5 ]]; then
    brightnessctl set 1%
  else
    brightnessctl set 5%-
  fi
  ;;
esac

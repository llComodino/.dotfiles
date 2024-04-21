#!/usr/bin/env bash

player_metadata="$(playerctl metadata)"

artist="$(printf "%s" "$player_metadata" | grep 'xesam:artist' | awk -F "artist" '{print $2}')"
title="$(printf "%s" "$player_metadata" | grep 'xesam:title' | awk -F "title" '{print $2}')"

artist=$(printf "%s" "$artist" | sed 's/^[[:space:]]*//')
title=$(printf "%s" "$title" | sed 's/^[[:space:]]*//')

[ -z "$artist" ] && exit 2
[ -z "$title" ] && exit 2

printf "%s - %s" "$title" "$artist"

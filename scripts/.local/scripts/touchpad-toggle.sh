#!/usr/bin/env sh

id="$(xinput list | grep "Touchpad" | awk -F"=" '{print $2}' | awk '{print $1}')"
query_status="$(xinput list-props "$id" | grep "Device Enabled" | awk -F ":" '{print $2}')"
status="${query_status#"${query_status%%[![:space:]]*}"}"

[ "$status" = "1" ] && xinput disable "$id"
[ "$status" = "0" ] && xinput enable "$id"

#!/usr/bin/env bash

DEVICE="asue120a:00-04f3:319b-touchpad"
STORAGE_FILE="/tmp/trackpad_state"

if [ ! -f "$STORAGE_FILE" ]; then
    echo "enabled" > "$STORAGE_FILE"
fi

CURRENT_STATE=$(cat "$STORAGE_FILE")

if [ "$CURRENT_STATE" = "enabled" ]; then
    hyprctl keyword "device[$DEVICE]:enabled" false
    echo "disabled" > "$STORAGE_FILE"
    notify-send "Trackpad Disabled"
else
    hyprctl keyword "device[$DEVICE]:enabled" true
    echo "enabled" > "$STORAGE_FILE"
    notify-send "Trackpad Enabled"
fi

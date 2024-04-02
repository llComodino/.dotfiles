#!/usr/bin/env sh

printf "%s" "$(asusctl profile -p | awk '{print $4}')"

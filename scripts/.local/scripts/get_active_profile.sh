#!/usr/bin/env bash

printf "%s" "$(asusctl profile -p | awk '{print $4}')"

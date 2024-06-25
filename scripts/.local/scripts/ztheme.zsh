#!/usr/bin/env zsh

ZSHRC=$HOME/.zshrc

[[ ! -f $HOME/.zshrc ]] && "zshrc not found" && exit 2
[[ "$1" == "--help" ]] && echo "ztheme - zshell theme changer" && exit 2

themes="$(ls "$ZSH"/themes/ 2> /dev/null)"
[[ -z $themes ]] && printf "%s" "No themes found in $ZSH" && exit 2
themes_names="$(printf "%s" "$themes" | sed 's|\..*||')"

new_theme="$(printf "%s" "$themes_names" | fzf)"
[[ -z $new_theme ]] && echo "No theme selected" && exit 2

sed -i "s|ZSH_THEME=.*|ZSH_THEME=\"$new_theme\"|" "$ZSHRC"

. $ZSHRC

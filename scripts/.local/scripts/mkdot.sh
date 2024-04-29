#!/usr/bin/env bash

[ -z "$1" ] && echo "Usage: mkdot [ FILE/DIR ]" && exit 1

target="$(realpath "$1")"

[ ! -f "$target" ] && [ ! -d "$target" ] && echo "$1 does not exist" && exit 1
[ -L "$target" ] && echo "Can't use on symlinks" && exit 1
[ -d "$target" ] && FILETYPE="dir"
[ -f "$target" ] && FILETYPE="file"

if printf "%s" "$target" | grep -q "$DOTFILES"; then
  echo "File already stowed"
  exit 1
fi

if ! printf "%s" "$target" | grep -q "/home/$USER/"; then
  echo "Can't stow a non user file"
  exit 1
fi

base_name="$(basename "$1")"
stowfolder="$(printf "%s" "$target" | sed "s|/home/$USER/||")"

case $FILETYPE in

"dir")
  echo "Backing up $base_name as $HOME/$base_name.bak"
  cp -r "$target" "$HOME/$base_name.bak"

  if [ -d "$HOME/$base_name.bak" ]; then
    rm -r "$target"
  else
    echo "Something went wrong"
    exit 1
  fi

  echo "Creating $DOTFILES/$base_name"
  mkdir "$DOTFILES/$base_name"

  IFS='/' read -ra dirs <<<"$stowfolder"
  stowfolder="$DOTFILES/$base_name"

  for dir in "${dirs[@]}"; do
    echo "Creating $stowfolder/$dir"
    mkdir "$stowfolder/$dir"

    stowfolder="$(printf "%s/%s" "$stowfolder" "$dir")"
  done

  echo "Copying $HOME/$base_name.bak contents to $stowfolder/"
  if cp -r "$HOME/$base_name.bak"/. "$stowfolder/"; then
    . "$DOTFILES/install"
  else
    echo "Something went wrong"
    exit 1
  fi

  ;;

"file")

  echo "Backing up $base_name as $HOME/$base_name.bak"
  cp "$target" "$HOME/$base_name.bak"

  if [ -f "$HOME/$base_name.bak" ]; then
    rm -r "$target"
  else
    echo "Something went wrong"
    exit 1
  fi

  IFS='/' read -ra dirs <<<"$stowfolder"
  stowfolder="$DOTFILES/$base_name"

  for dir in "${dirs[@]}"; do
    echo "Creating $stowfolder/$dir"
    mkdir "$stowfolder/$dir"

    stowfolder="$(printf "%s/%s" "$stowfolder" "$dir")"
  done

  echo "Copying $HOME/$base_name.bak contents to $stowfolder/"
  if cp -r "$HOME/$base_name.bak"/. "$stowfolder/"; then
    . "$DOTFILES/install"
  else
    echo "Something went wrong"
    exit 1
  fi
  ;;
esac

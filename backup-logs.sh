#!/bin/bash

# This script takes in a path to a file and moves it to a backup location.
# This is intended for backing up log files

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <arg1> <arg2>"
    exit 1
fi

src="$1"

if [[ ! -f "$src" ]]; then
    echo "Error: Source file does not exist: $src"
    exit 1
fi

dest="$2"

mkdir -p $dest
srcBase="$(basename "$src")"
name="${srcBase%.*}" # removes file extension
ts="$(date +%Y%m%d-%H%M%S)"
dest_path="${dest}/${name}_${ts}.bkp"
mv "$src" "$dest_path"

touch "$src"
chmod 666 "$src"
chmod 444 "$dest_path"

echo "$(date) : Successfully created backup!"

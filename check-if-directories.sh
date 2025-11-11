#!/bin/bash

# This script checks if the items in this location are directories
# User must provide the directory to check as a parameter

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory_to_check>"
    exit 1
fi

LOCATION="$1"

# Ensure location exists and is a directory
if [ ! -d "$LOCATION" ]; then
    echo "Error: '$LOCATION' is not a valid directory."
    exit 1
fi

for item in "$LOCATION"/* ; do
    # Check for . and .. and skip them
    base_item="$(basename "$item")"
    if [ "$base_item" = "." ] || [ "$base_item" = ".." ]; then
        continue
    fi

    # Check if item is a directory
    if [ -d "$item" ]; then 
        echo "✅ '$item' is a directory"
    else
        echo "❌ '$item' is NOT a directory"
    fi
done
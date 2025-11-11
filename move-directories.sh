#!/bin/bash

# This script moves all directories into a new directory

# Auto-exit if a command fails
set -e

# Checking parameters
if [ "$#" -ne 2 ]; then
	echo "Usage: $0 <source_directory> <destination_directory>"
	exit 1
fi

SOURCE="$1"
DEST="$2"

SOURCE="$(realpath "$SOURCE")"
DEST="$(realpath -m "$DEST")"

# Checks if source exists
if [ ! -d "$SOURCE" ]; then
	echo "Error: Source directory '$SOURCE' does not exist."
	exit 1
fi

# Create destination if it doesn't exist yet
if [ ! -d "$DEST" ]; then
	echo "Destination directory '$DEST' does not exist. Creating it..."
	mkdir -p "$DEST"
fi

# Move directories
echo "Moving directories from '$SOURCE' to '$DEST'..."
echo

# Loop through non-hidden directories in source
for dir in "$SOURCE"/*/; do
	# Skip if no directories exist
	[ -d "$dir" ] || continue

	dir_abs="$(realpath "$dir")"

	# Check to make sure we're not moving destination into itself
	if [[ "$dir_abs" == "$DEST" ]]; then
		echo "Skipping destination directory itself: $dir_abs"
		continue
	fi

	echo "Moving $(basename "$dir_abs")..."
	mv "$dir_abs" "$DEST"/
done

echo
echo "✅ All directories have been moved successfully to $DEST"
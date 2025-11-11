#!/bin/bash
# Script to create test directories with a user-provided base name

# Check if user provided a base name
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <base_name_for_directories>"
    exit 1
fi

BASE="$1"

# Create directories from 1 to 10
for i in {1..10}; do
    DIR_NAME="${BASE}${i}"
    if [ -d "$DIR_NAME" ]; then
        echo "Directory $DIR_NAME already exists, skipping..."
    else
        mkdir "$DIR_NAME"
        echo "Created directory: $DIR_NAME"
    fi
done

echo "✅ Done creating test directories."

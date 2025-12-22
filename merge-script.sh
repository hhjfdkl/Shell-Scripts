#!/bin/bash

# Courtesy of ChatGPT for the baseline script 
# This needs to be adjusted to specifically check for yy-mm-dd.txt files
# This needs to create a new file titled something like "yy-mm_(anything).txt" and append the contents of the .txt files to it
# Over each iteration appending results to the resulting .txt file, the resulting file should include the original file name

# Below works, but needs to be refined


if [ "$#" -ne 1 ]; then
    echo "Usage: $0 - Needs argument. HINT: Input a target directory"
    exit 1
fi

input_directory="$1"
ARCHIVE=$input_directory"Archive/"
LANDING=$input_directory"Monthly_Summary/"



# Loop through the files in order of date (yy-mm-dd format)
for file in $(ls ${input_directory}*.txt | sort); do

    # Extract the base filename (e.g., "yy-mm-dd.txt")
    filename=$(basename "$file")

    # Check if the filename matches the yy-mm-dd format (using regex)
    if [[ "$filename" =~ ^[0-9]{2}-[0-9]{2}-[0-9]{2}\.txt$ ]]; then

        if [ ! -d "$ARCHIVE" ]; then
            mkdir "$ARCHIVE"
            echo "Created $ARCHIVE"
        fi

        if [ ! -d "$LANDING" ]; then
            mkdir "$LANDING"
            echo "Created $LANDING"
        fi

        # Extract the year and month from the filename (yy-mm-dd.txt)
        year_month=$(echo "$filename" | cut -d'-' -f1,2)
        year_month="${LANDING}${year_month}_monthly-summary.txt"
        # Append the content of the current file to the new file (yy-mm.txt)
        echo "Appending to ${year_month}"
        echo -e "\n\n==============================\n${filename%.txt}\n==============================\n" >> "${year_month}"
        cat "$file" >> "${year_month}"
        mv $file $ARCHIVE

    else
        echo "Skipping file (invalid format): $filename"
    fi
done

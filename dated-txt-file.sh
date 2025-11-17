#!/bin/bash


if [ "$#" -ne 1 ]; then
    echo "Usage: $0 - Needs argument"
    exit 1
fi

LOCATION="$1"

if [ ! -d "$LOCATION" ]; then
    echo "Error: '$LOCATION' must be a directory."
    exit 1
fi

DATE="$(date +'%y-%m-%d').txt"

touch "$LOCATION$DATE" 

if [ -f "$LOCATION$DATE" ]; then
    echo "$(date) : File was created. $LOCATION$DATE"
else
    echo "$(date) : File was not created."    
fi 
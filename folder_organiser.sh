#!/bin/bash

# Author: Uzezi Jephter Oghenekaro
# Created At: 01/04/2025
# Last Updated: 01/04/2025

# Description
# This script help users to organise files in a specific folder

# Usage
# folder_organiser.sh

read -rp "which folder do you want to organise its contents ?: " folder

# validate inputs
if [ ! -d "$folder" ]; then
    echo "Not a valid folder"
    exit 1
fi

while read -r file; do
    case "$file" in
        *.jpg|*.jpeg|*.png)
            [ -d "$folder/images" ] || mkdir -p "$folder/images"
            echo "Moving file $file to $folder/images..."
            mv "$folder/$file" "$folder/images/$file"
        ;;
        *.doc|*.docx|*.txt|*.pdf)
            [ -d "$folder/documents" ] || mkdir -p "$folder/documents"
            echo "Moving file $file to $folder/documents..."
            mv "$folder/$file" "$folder/documents/$file"
        ;;
        *.xls|*.xlsx|*.csv)
            [ -d "$folder/spreadsheets" ] || mkdir -p "$folder/spreadsheets"
            echo "Moving file $file to $folder/spreadsheets..."
            mv "$folder/$file" "$folder/spreadsheets/$file"
        ;;
        *.sh)
            [ -d "$folder/scripts" ] || mkdir -p "$folder/scripts"
            echo "Moving file $file to $folder/scripts..."
            mv "$folder/$file" "$folder/scripts/$file"
        ;;
        *.zip|*.tar|*.tar.gz|*.tar.bz2)
            [ -d "$folder/archives" ] || mkdir -p "$folder/archives"
            echo "Moving file $file to $folder/archives..."
            mv "$folder/$file" "$folder/archives/$file"
        ;;
        *.ppt|*.pptx)
            [ -d "$folder/presentations" ] || mkdir -p "$folder/presentations"
            echo "Moving file $file to $folder/presentations..."
            mv "$folder/$file" "$folder/presentations/$file"
        ;;
        *.mp3)
            [ -d "$folder/audio" ] || mkdir -p "$folder/audio"
            echo "Moving file $file to $folder/audio..."
            mv "$folder/$file" "$folder/audio/$file"
        ;;
        *.mp4)
            [ -d "$folder/video" ] || mkdir -p "$folder/video"
            echo "Moving file $file to $folder/video..."
            mv "$folder/$file" "$folder/video/$file"
        ;;
    esac
done < <(ls "$folder")


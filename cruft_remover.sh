#!/bin/bash

# Author: Uzezi Jephter Oghenekaro
# Created At: 01/04/2025
# Last Updated: 01/04/2025

# Description
# This script help users to remove unused files from a specified folder

# Usage
# cruft_remover.sh



read -rp "which folder they want to remove \"cruft\" from ?: " folder
read -rp "how many days files should be unmodified for to be considered \"cruft\" ?: " days

# validate inputs
if [ ! -d "$folder" ]; then
    echo "Not a valid folder"
    exit 1
fi

if [ "${days:-0}" -le 0 ]; then
    echo "days entered must be greater than zero"
    exit 1
fi

readarray -t found_files < <(find "$folder" -mtime "$days" -type f -maxdepth 1)

if [ ${#found_files[@]} -gt 0 ]; then
    echo "${#found_files[@]} files where found."
else
    echo "No files where found that are yet to modified for the past $days days"
    exit 0
fi

for file in "${found_files[@]}"; do
    echo "Type y/n to confirm deletion:"
    rm -i "$file"
done

exit 0
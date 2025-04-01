#!/bin/bash

# Author: Uzezi Jephter Oghenekaro
# Created At: 01/04/2025
# Last Updated: 01/04/2025

# Description
# This script present the user with a menu where they can choose 
# which of the two scripts (cruft_remover and folder_organiser) they want 
# to run and then have this script run the relevant script 
# based on the user’s selection

# Usage
# toolkit.sh

echo
PS3="Select among the script which you want to run: "
select script in cruft_remover folder_organiser; do
    case "$script" in 
    cruft_remover)
        ./cruft_remover.sh
    ;;
    folder_organiser)
        ./folder_organiser.sh
    ;;
    esac
    break
done
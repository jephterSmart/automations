#!/bin/bash

# Author: Uzezi Jephter Oghenekaro
# Created At: 31/03/2025
# Last Updated: 31/03/2025

# Description
# This script shows a timer countdown in seconds on screen to the user,
# begining from what the user specified.

# Usage
# timer_countdown -m 20 -s 5
# where -m is the number of minutes and -s is number of seconds

seconds_total=0
while getopts "m:s:h" opt; do
    case "$opt" in
        m)
        if [[ -n $OPTARG && $OPTARG -lt 0 ]]; then
            echo "minutes (-m) must be greater or equal to zero"
            exit 1
        fi
        seconds_total=$(( ($OPTARG * 60) + $seconds_total ))
        ;;
        s)
        if [[ -n $OPTARG && $OPTARG -lt 0 ]]; then
            echo "seconds (-s) must be greater or equal to zero"
            exit 1
        fi
        seconds_total=$(( $OPTARG + $seconds_total ))
        ;;
        h) 
        echo "Usage: $0 -m <int> -s <int> "
        ;;
        \?)
        echo "Please check usage by typing $0 -h"
        ;;
        *)
        echo not valid ;;
    esac
done

if [ $seconds_total -eq 0 ]; then
    echo "Enter a number greater than zero for either minute (-m) or second (-s)"
    exit 1
fi

while [[ $seconds_total -gt 0 ]]; do
    echo "$seconds_total seconds remaining..."
    let seconds_total=$seconds_total-1
    sleep 1
done

echo "Time's Up"

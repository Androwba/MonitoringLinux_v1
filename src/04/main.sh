#!/bin/bash

if [ $# -eq 0 ]; then
    source configurations.conf
    export LeftBackground=$column1_background
    export LeftFont=$column1_font_color
    export RightBackground=$column2_background
    export RightFont=$column2_font_color
    ./colours.sh
else
    echo -e "\e[0;31m!!! This script doesn't take any parameters !!!\e[0m"
fi

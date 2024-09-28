#!/bin/bash

if [ $# -eq 4 ]; then
    export "LeftBackground=$1" "LeftFont=$2" "RightBackground=$3" "RightFont=$4"
    ./conditions.sh
else
    echo -e "\e[0;31m!!! This script starts with only\e[0m 4 \e[0;31mparameters !!!\e[0m"
fi

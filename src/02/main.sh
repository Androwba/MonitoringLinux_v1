#!/bin/bash

if [ $# -eq 0 ]; then
    ./hostinfo.sh
    ./meminfo.sh
    ./writing.sh
else
    echo -e "\e[0;31m!!! This script doesn't take any parameters !!!\e[0m"
fi

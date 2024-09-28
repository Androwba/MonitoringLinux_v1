#!/bin/bash

start_t="$(cat /proc/uptime | awk '{ print $1 }')"

if [[ $# -eq 1 ]]; then
    if [[ "${1: -1}" == "/" ]]; then
        if [[ -d $1 ]]; then
            for i in $@; do
                echo -e "\e[4m\e[93mChecking \e[46m$i\e[0m \e[4m\e[93mdirectory...\e[0m\n"
                source ./sysresearch.sh
            done
        else
            echo -e "\"\033[34m$1\033[0m\" \033[31mdirectory doesn't exist !\033[0m"
        fi
        end_t="$(cat /proc/uptime | awk '{ print $1 }') - $start_t"
        elapsed=$(echo $end_t | bc)
        printf "\033[33mScript execution time (in seconds):\033[0m %.1f\n" $elapsed
    else
        echo -e "\e[0;31mThe parameter must end with backslash\e[0m '\e[0;33m/\e[0m'"
        exit 1
    fi
else
    echo -e "\e[0;31m!!! This script starts only with\e[0m 1 \e[0;31mparameter !!!\e[0m"
    exit 1
fi

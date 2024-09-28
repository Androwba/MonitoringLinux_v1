#!/bin/bash

for i in 0 1 2 3; do
    if [[ ${param[$i]} < 1 || ${param[$i]} > 6 ]]; then
        echo -e "      \e[0;31m!!! The parameter scale starts from\e[0m 1 \e[0;31mto\e[0m 6 \e[0;31minclusive !!!\e[0m"
        exit 1
    fi
done

if [[ ${param[0]} == ${param[1]} || ${param[2]} == ${param[3]} ]]; then
    echo -e "\033[1;33mThe font and background colours of one column must not match!\e[0m"
    exit 1
fi

#!/bin/bash

echo " "
if [[ ${default[0]} == setdef ]]; then
    echo "Column 1 background = default ${color[0]}"
else
    echo "Column 1 background = ${param[0]} ${color[0]}"
fi

if [[ ${default[1]} == setdef ]]; then
    echo "Column 1 font color = default ${color[1]}"
else
    echo "Column 1 font color = ${param[1]} ${color[1]}"
fi

if [[ ${default[2]} == setdef ]]; then
    echo "Column 2 background = default ${color[2]}"
else
    echo "Column 2 background = ${param[2]} ${color[2]}"
fi

if [[ ${default[3]} == setdef ]]; then
    echo "Column 2 font color = default ${color[3]}"
else
    echo "Column 2 font color = ${param[3]} ${color[3]}"
fi

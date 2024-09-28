#!/bin/bash

read -p "Do you want to write the data to a file? (Y/N)" answer
rm -rf *.status

if [[ $answer == y || $answer == Y ]]; then
    save="$(date +"%d_%m_%y_%H_%M_%S").status"
    echo -e "\e[0;32mWriting . . .\e[0m"
    ./hostinfo.sh >$save
    ./meminfo.sh >>$save
else
    echo -e "You chose the answer \e[0;31m\"NO\"\e[0m"
fi

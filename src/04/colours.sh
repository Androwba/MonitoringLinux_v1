#!/bin/bash

# font colors
FontWhite="\033[107m"
FontRed="\033[41m"
FontGreen="\033[42m"
FontBlue="\033[44m"
FontPurple="\033[45m"
FontBlack="\033[40m"
# background colors
BgWhite="\033[97m"
BgRed="\033[31m"
BgGreen="\033[32m"
Bgblue="\033[34m"
BgPurple="\033[35m"
BgBlack="\033[30m"
# zero of escape sequence
zero="\e[0m"

param=("$LeftBackground" "$LeftFont" "$RightBackground" "$RightFont")

for i in 0 1 2 3; do
    if [[ -z ${param[$i]} ]]; then # if string is null
        if [[ -z ${param[0]} ]]; then
            param[0]=6
            default[$i]=setdef
        elif [[ -z ${param[1]} ]]; then
            param[1]=1
            default[$i]=setdef

        elif [[ -z ${param[2]} ]]; then
            param[2]=2
            default[$i]=setdef

        elif [[ -z ${param[3]} ]]; then
            param[3]=4
            default[$i]=setdef
        fi
    fi
done

for i in 0 1 2 3; do
    if [[ ${param[$i]} == 1 ]]; then
        color[$i]="(white)"
    elif [[ ${param[$i]} == 2 ]]; then
        color[$i]="(red)"
    elif [[ ${param[$i]} == 3 ]]; then
        color[$i]="(green)"
    elif [[ ${param[$i]} == 4 ]]; then
        color[$i]="(blue)"
    elif [[ ${param[$i]} == 5 ]]; then
        color[$i]="(purple)"
    elif [[ ${param[$i]} == 6 ]]; then
        color[$i]="(black)"
    fi
done

source ./conditions.sh

for i in 0 2; do
    if [[ ${param[$i]} == 1 ]]; then
        set_col[$i]=$FontWhite
    elif [[ ${param[$i]} == 2 ]]; then
        set_col[$i]=$FontRed
    elif [[ ${param[$i]} == 3 ]]; then
        set_col[$i]=$FontGreen
    elif [[ ${param[$i]} == 4 ]]; then
        set_col[$i]=$FontBlue
    elif [[ ${param[$i]} == 5 ]]; then
        set_col[$i]=$FontPurple
    elif [[ ${param[$i]} == 6 ]]; then
        set_col[$i]=$FontBlack
    fi
done

for i in 1 3; do
    if [[ ${param[$i]} == 1 ]]; then
        set_col[$i]=$BgWhite
    elif [[ ${param[$i]} == 2 ]]; then
        set_col[$i]=$BgRed
    elif [[ ${param[$i]} == 3 ]]; then
        set_col[$i]=$BgGreen
    elif [[ ${param[$i]} == 4 ]]; then
        set_col[$i]=$BgBlue
    elif [[ ${param[$i]} == 5 ]]; then
        set_col[$i]=$BgPurple
    elif [[ ${param[$i]} == 6 ]]; then
        set_col[$i]=$BgBlack
    fi
done

HOSTNAME=$(uname -n)
echo -e "${set_col[0]}${set_col[1]}HOSTNAME$zero = ${set_col[2]}${set_col[3]}$HOSTNAME$zero"
TIMEZONE="$(cat /etc/timezone) UTC $(date +"%Z")"
echo -e "${set_col[0]}${set_col[1]}TIMEZONE$zero = ${set_col[2]} ${set_col[3]}$TIMEZONE$zero"
USER="$(id -u -n)"
echo -e "${set_col[0]}${set_col[1]}USER$zero = ${set_col[2]}${set_col[3]}$USER$zero"
OS="$(cat /etc/issue | awk '{print $1 $2}')"
echo -e "${set_col[0]}${set_col[1]}OS$zero = ${set_col[2]}${set_col[3]}$OS$zero"
DATE="$(date +"%d %B %Y %T")"
echo -e "${set_col[0]}${set_col[1]}DATE$zero = ${set_col[2]}${set_col[3]}$DATE$zero"
UPTIME="$(uptime -p)"
echo -e "${set_col[0]}${set_col[1]}UPTIME$zero = ${set_col[2]}${set_col[3]}$UPTIME$zero"
UPTIME_SEC="$(awk '{print int ($1)}' /proc/uptime)"
echo -e "${set_col[0]}${set_col[1]}UPTIME_SEC$zero = ${set_col[2]}${set_col[3]}$UPTIME_SEC$zero"
IP="$(hostname -I | awk '{print $1}')"
echo -e "${set_col[0]}${set_col[1]}IP$zero = ${set_col[2]}${set_col[3]}$IP$zero"
MASK="$(netstat -rn | awk 'NR==4{print $3}')" #Number of Record
echo -e "${set_col[0]}${set_col[1]}MASK$zero = ${set_col[2]}${set_col[3]}$MASK$zero"
GATEWAY="$(route -n | grep 'UG[ \t]' | awk '{print $2}')"
echo -e "${set_col[0]}${set_col[1]}GATEWAY$zero = ${set_col[2]}${set_col[3]}$GATEWAY$zero"
RAM_TOTAL="$(free -m | awk '/Mem:/{printf "%.3f GB", $2/1024}')"
echo -e "${set_col[0]}${set_col[1]}RAM_TOTAL$zero = ${set_col[2]}${set_col[3]}$RAM_TOTAL$zero"
RAM_USED="$(free -m | awk '/Mem:/{printf "%.3f GB", $3/1024}')"
echo -e "${set_col[0]}${set_col[1]}RAM_USED$zero = ${set_col[2]}${set_col[3]}$RAM_USED$zero"
RAM_FREE="$(free -m | awk '/Mem/{printf "%.3f GB", $4/1024}')"
echo -e "${set_col[0]}${set_col[1]}RAM_FREE$zero = ${set_col[2]}${set_col[3]}$RAM_FREE$zero"
SPACE_ROOT="$(df /root/ | awk '/\/$/ {printf "%.2f MB", $2/1024}')"
echo -e "${set_col[0]}${set_col[1]}SPACE_ROOT$zero = ${set_col[2]}${set_col[3]}$SPACE_ROOT$zero"
SPACE_ROOT_USED="$(df /root/ | awk '/\/$/ {printf "%.2f MB", $3/1024}')"
echo -e "${set_col[0]}${set_col[1]}SPACE_ROOT_USED$zero = ${set_col[2]}${set_col[3]}$SPACE_ROOT_USED$zero"
SPACE_ROOT_FREE="$(df /root/ | awk '/\/$/ {printf "%.2f MB", $4/1024}')"
echo -e "${set_col[0]}${set_col[1]}SPACE_ROOT_FREE$zero = ${set_col[2]}${set_col[3]}$SPACE_ROOT_FREE$zero"

source ./output.sh

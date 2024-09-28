#!/bin/bash

if [ $# -eq 1 ]; then
	if_number='^[+-]?[0-9]+([.][0-9]+)?$' #regex

	if [[ $1 =~ $if_number ]]; then
		echo -e "\e[1;31mInvalid parameter, please enter a text"
	else
		echo "$1"
	fi
else
	source ./errormessage.sh
	error
fi
source ./argc.sh

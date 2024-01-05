#!/bin/bash

RED='\e[31m'
GREEN='\e[32m'
RESET='\e[0m'
declare -i number_move=0
declare -a numbers
hit=0
miss=0



while :
do
	random_number=$(($RANDOM % 10))
	echo "Step ${number_move}"
	read -p "Please enter number from 0 to 9 (q - quit): " input
	case "${input}" in
		[0-9])
			if [[ "${input}" == "${random_number}" ]]
				then
					echo "Hit! My number: ${random_number}"
					((hit++))
					numbers+=(${GREEN}${random_number}${RESET})
				else
					echo "Miss! My number: ${random_number}"
					((miss++))
					numbers+=(${RED}${random_number}${RESET})
			fi
			total=$(( hit + miss ))
			let hit_percent=hit*100/total
			let miss_percent=100-hit_percent
			echo "Hit: ${hit_percent}%" "Miss: ${miss_percent}%"
			echo -e "Numbers: ${numbers[@]: -10}\n"
			((number_move++))
		;;
		q)
			echo "Exit..."
			break
		;;
		*)
			echo "Not valid input"
			echo "Please repeat"
		;;
	esac
done
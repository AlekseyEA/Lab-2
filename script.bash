#!/bin/bash

part_to_bin() {
	binary=$(echo "obase=2; $1" | bc)
	printf "%08d." $binary
}

if [[ $1 =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]];
then
	IFS='.' read -ra parts <<< "$1"
	
	binary=""
	for part in "${parts[@]}";
	do
		binary="$binary$(part_to_bin "$part")"
	done
	
	echo "${binary::-1}"
else
	echo "This is not IPv4"
fi

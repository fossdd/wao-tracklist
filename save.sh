#!/bin/bash

REGEX='(?<=>                    )(\s*.*)(?=                    <\/a>)'
STATIONS=( "technobase" "housetime" "hardbase" "trancebase" "coretime" "clubtime" "teatime" "replay" )

for station in "${STATIONS[@]}"
do
	baseurl=https://www.$station.fm/trackliste
	zcmlimitstart=0
	for i in {1..10}; do
		url=$baseurl?zcmlimitstart=$zcmlimitstart
		curl $url | grep "$REGEX" -P -o | while read -r line ; do
			echo $line[station=$station] | tee -a list
		done
		zcmlimitstart=`expr $zcmlimitstart + 15`
	done
done

sort -u -o list list

#!/bin/bash

REGEX='(?s)(?<=http:\/\/itunes.apple.com\/WebObjects\/MZSearch.woa\/wa\/advancedSearchResults\?artistTerm=)(.*?)(?=&uo=8&at=11lK3m)'
STATIONS=( "technobase" "housetime" "hardbase" "trancebase" "coretime" "clubtime" "teatime" "replay" )

for station in "${STATIONS[@]}"
do
	baseurl=https://www.$station.fm/trackliste
	zcmlimitstart=0
	for i in {1..200}; do
		url=$baseurl?zcmlimitstart=$zcmlimitstart
		curl $url | grep "$REGEX" -P -o | sed -e 's/&songTerm=/ - /g' | while read -r line ; do
			echo $line | tee -a lists/$station
		done
		zcmlimitstart=`expr $zcmlimitstart + 15`
	done
	sort -u -o lists/$station lists/$station
done

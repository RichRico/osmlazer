#!/bin/bash
	while IFS='' read -r line || [[ -n "$line" ]]; do

	    echo {\"type\": \"FeatureCollection\", \"features\": [$line]} > zone.geojson
	    #zoneName="$(node index.js zone.geojson)"
	    #cp zone.geojson $zoneName.geojson > name.json
	    geojson2poly zone.geojson zone.poly
	    osmconvert ethiopia-latest.osm.pbf -B=zone.poly --complete-ways --complex-ways -o=region.pbf
	    #node /home/ds/apps/osmlazer/index.js --file region.pbf --mode basemap | jq .
	    info="$(node /home/ds/apps/osmlazer/index.js --file region.pbf --mode poi)"
    	echo $info > info.json
    	result = "$(node merge.js zone.geojson info.json)"

    	echo $result >> outpt.json


    
	done < res.json

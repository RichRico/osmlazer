#!/bin/bash
echo "info"
	while IFS='' read -r line || [[ -n "$line" ]]; do

	    echo {\"type\": \"FeatureCollection\", \"features\": [$line]} > zone.geojson
	    zoneName="$(node index.js zone.geojson)"
	    echo $zoneName > name.$$.json
	    #cp zone.geojson $zoneName.geojson > name.json
	    geojson2poly zone.geojson zone.poly
	    osmconvert ethiopia-latest.osm.pbf -B=zone.poly --complete-ways --complex-ways -o=region.pbf
	    #node /home/ds/apps/osmlazer/index.js --file region.pbf --mode basemap | jq .
	    info="$(node /home/ds/apps/osmlazer/index.js --file region.pbf --mode poi)"
    	echo $info > info.$$.json
    
	done < res.json

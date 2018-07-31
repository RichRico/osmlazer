# osmlazer
osmium based OpenStreetMap data filter. Input is an OSM PBF, output is a stream of GeoJSON FeatureCollection per line.

## Setup

### Dependencies
#### Linux

```
apt-get install -y build-essential zlib1g-dev unzip python-dev \
  git libtool g++ autotools-dev automake cmake make xutils-dev realpath ragel
```

#### osx

```
brew install autoconf automake libtool makedepend
```

* [Install osmium dependencies](https://github.com/osmcode/node-osmium#depends)
* git clone https://github.com/geohacker/osmlazer.git
* `npm install`

## Usage

`node index.js --file /path/to/pbf --filter /path/to/filter` 

## Filters

Filters are Mapbox GL filters. See `filters/` for examples.


## For a complete exercise we will evaluate for Ethiopia in a set of areas

**For this exercise, we will have to change the branch to `readiness` and then access the Ethiopian file and execute the next steps in the terminal**

- These steps are to change branches and leave everything ready

```
cd osmlazer
git checkout readiness
git fetch --all
npm install
```

- To evaluate we need to download the .pbf file for Ethiopia from [Geofabrik](http://download.geofabrik.de/) and save it inside the Ethiopia folder

- We also need the file of the set of zones of Ethiopia in .json format to evaluate by zones, in our case we will use the file res.json that already exists

- If you have another set of zones in .geojson format to evaluate, you can use the following command to convert .json to be evaluated.

```
geokit fc2frows input.geojson > output.json
```

- Run the following command in the terminal inside Ethiopia

```
./index.sh
```

- Then you need to convert the `mergeoutput.json` file to `.geojson` format using the following command

```
osmlinth -g mergeoutput.json > nameOutputFile.geojson
```

- The next step is to convert the `.geojson` file to` .csv` format and then view it in a spreadsheet and filter the information that we need.

```
geokit fc2csv nameOutputFile.geojson > csv.csv
```

**Note:** The final result doesn't give us the exact results because there are areas that it shares with 2 zones and the size of the area varies because it doesn't consider the measure of just up to the limit of the borders.
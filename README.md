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

```
node index.js --file /path/to/pbf --mode specify_your_mode

mode can be basemap/density/poi/address

``` 

## Update turf and @turf/line-to-polygon

http://turfjs.org/

For more informarion https://github.com/Turfjs/turf

https://github.com/Turfjs/turf/tree/master/packages/turf-line-to-polygon

```
npm install @turf/turf

npm install @turf/line-to-polygon

npm install @turf/line-to-polygon --save

after 

npm install
```

## Filters

Filters are Mapbox GL filters. See `filters/` for examples.

### For a complete exercise we evaluating for Ehtiopia

**For this exercise we need to access to file ethiopia and execute the next steps in the terminal**

- Before to evaluate we need to download the file .pbf for ethiopia from geofabrik and save inside the file ethiopia

- Also we need the file of a set of zones within ethiopia in format .json, in our case res.json 

- if you have a another set of zones in geojson, you can use the next command to conver in .json. Set each feature into a row in files from feature collection

```
geokit fc2frows input.geojson > output.json
```

- Run the command in the terminal inside ehtiopia

```
./index.sh
```

- After yo need to convert the file mergeoutput.json to file .geojson using the next command

```
osmlinth -g mergeoutput.json > nameOutputFile.geojson
```

- The next step is to convert the file .geojson to file .csv for to show in a spreadsheet and filter the information that we need.

```
geokit fc2csv nameOutputFile.geojson > csv.csv
```
```

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
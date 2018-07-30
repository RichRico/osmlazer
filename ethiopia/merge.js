var fs = require('fs');
var geojson = JSON.parse(fs.readFileSync('zone.geojson', 'utf8'));
var info = JSON.parse(fs.readFileSync('info.json', 'utf8'));
geojson.features[0].properties.metrics = info;
console.log(JSON.stringify(geojson));

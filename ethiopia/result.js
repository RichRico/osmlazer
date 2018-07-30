var fs = require('fs');
var geojson = JSON.parse(fs.readFileSync('mergeoutput.json').toString());
console.log(geojson.features[0].properties.metrics);

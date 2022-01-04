var fs = require('fs');
var math = require("/usr/local/lib/node_modules/mathjs");
var array = fs.readFileSync('3.txt').toString().split("\n");

const matrix = math.matrix(array.map((x)=>{ return x.split("")}));

console.log(matrix.get([0,0]));




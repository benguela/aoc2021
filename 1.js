var fs = require('fs');
var array = fs.readFileSync('1.txt').toString().split("\n");

console.log(array.map((x,y)=>{ return x*x; }));




          
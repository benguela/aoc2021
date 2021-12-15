var fs = require('fs');
var z = require('zebras')
var array = fs.readFileSync('1.txt').toString().split("\n");

console.log(array.map((x,i)=>{ return x > array[i-1] }).reduce((a,b)=>a+b,0));

sw = z.rolling(z.sum, 3, array)

console.log(sw.map((x,i)=>{ return x > sw[i-1] }).reduce((a,b)=>a+b,0));
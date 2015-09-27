// Array.prototype.uniq = function() {
//   var unique = [];
//   this.forEach(function(entry) {
//     if (unique.indexOf(entry) === -1) {
//       unique.push(entry);
//     }
//   });
//   return unique;
// };
// var notUnique = [0,12,3,3,5];
// var uniqueStuff = notUnique.uniq();
// console.log(uniqueStuff);
// console.log(notUnique);
//
// Array.prototype.twoSum = function() {
//   var results = [];
//   for(var idx1 = 0; idx1 < this.length; idx1 += 1) {
//     for(var idx2 = (idx1 + 1); idx2 < this.length; idx2 += 1) {
//       if ((this[idx1] + this[idx2]) === 0) {
//         results.push([idx1, idx2]);
//       }
//     }
//   }
//   return results;
// };
//
// var asdfasdf = [-1, 0, 2, -2, 1];
// console.log(asdfasdf.twoSum());
//
// Array.prototype.transpose = function() {
//   var length = this.length;
//   var width = this[0].length;
//
//   var result = [];
//   for (var newCols = 0; newCols < width; newCols++) {
//     result.push([]);
//   }
//
//   for (var row = 0; row < length; row++) {
//     for (var col = 0; col < width; col++) {
//       result[col][row] = this[row][col];
//     }
//   }
//
//   return result;
// };
//
// var preTranspose = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
// var postTranspose = preTranspose.transpose();
// console.log(preTranspose);
// console.log(postTranspose);

Array.prototype.myEach = function(proc) {
    for (var i = 0; i < this.length; i++) {
      proc(this[i]);
    }
    return this;
};

var result = [];
var stupidArr = [0, 1, 2, 3];
// var log = console.log;

var func = function(arg1){
  // console.log(arg1 + 1);
  return (arg1 + 1);
  // console.log(arg1);
};

// stupidArr.myEach(func);
// console.log(stupidArr);

Array.prototype.myMap = function(proc) {
  var results = [];
  this.myEach(function (item) {
    // console.log(item);
    results.push(proc(item));
  });
  return results;
};

var mapResults = stupidArr.myMap(func);
// console.log(mapResults);
// console.log(stupidArr);

Array.prototype.myInject = function(accum, proc) {
  this.myEach(function(item){
    accum = proc(accum, item);
  });

  return accum;
};

var injectProc = function(a, el) {
  return a + el;
};

var injectValue = stupidArr.myInject(0, injectProc);
console.log(injectValue);

Array.prototype.bubbleSort = function(){
  var swapped = true;
  var newArr = this.slice(0);
  while (swapped){
    swapped = false;
    for (var idx = 0; idx < newArr.length - 1; idx++){
      if (newArr[idx] > newArr[idx + 1]){
        swapped = true;
        var temp = newArr[idx];
        newArr[idx] = newArr[idx + 1];
        newArr[idx + 1] = temp;
      }
    }
  }
  return newArr;
};

var unsortedArr = [3, 2, 4, 1, 5];
var sortedArr = unsortedArr.bubbleSort();
console.log(unsortedArr);
console.log(sortedArr);

String.prototype.substrings = function() {
  var substrings = [];
  for (var idx1 = 0; idx1 < this.length; idx1++) {
    for (var idx2 = idx1 + 1; idx2 <= this.length; idx2++) {
      substrings.push(this.substring(idx1, idx2));
    }
  }
  return substrings;
};

var cat = "cat";
console.log(cat.substrings());

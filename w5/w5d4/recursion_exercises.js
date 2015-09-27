var range = function(start, end){
  if (start > end){
    return [];
  } else {
    return [start].concat(
      range(start + 1, end)
    );
  }
};
console.log(range(1, 5));

Array.prototype.sumArray = function(){
  if (this.length === 1){
    return this[0];
  } else {
    return this[0] + this.slice(1).sumArray();
  }
};

var testArr = [0, 1, 2, 3];
console.log(testArr.sumArray());

var expOne = function(b, n) {
  if (n === 0) {
    return 1;
  }
  else {
    return b * expOne(b, n - 1);
  }
};

console.log(expOne(2,4));

var expTwo = function(b, n) {
  if (n === 0) {
    return 1;
  }
  else if (n === 1) {
    return b;
  }
  else if ( n % 2 === 0 ){
    var stuff = expTwo(b, n / 2);
    return stuff * stuff;
  }
  else {
    var otherStuff = expTwo(b, (n - 1) / 2);
    return b * otherStuff * otherStuff;
  }
};

console.log(expTwo(2,4));

var fib = function(n) {
  if (n === 0) {
    return [];
  }
  else if (n === 1) {
    return [0];
  }
  else if (n === 2) {
    return [0, 1];
  }
  else {
    var fibArray = fib(n - 1);
    return fibArray.concat(
      [fibArray[fibArray.length - 1] + fibArray[fibArray.length - 2]]
    );
  }
};

// for (var fibIndex = 0; fibIndex < 10; fibIndex++) {
//   console.log(fib(fibIndex));
// }

var bsearch = function(array, target) {
  if (array.length === 1 && array[0] !== target){
    return -1;
  }
  console.log(array);
  var idx = Math.floor(array.length / 2);
  var left = array.slice(0, idx);
  var right = array.slice(idx);
  if (array[idx] === target){
    return idx;
  } else if (array[idx] > target){
    return bsearch(left, target);
  } else {
    var found = bsearch(right, target);
    if (found === -1){
      return found;
    } else {
      return idx + found;
    }
  }
};
// console.log(bsearch([0, 1, 2, 3], 1));

var makeChange = function(total, coins) {
  var actualCoins = coins || [25, 10, 5, 1];

  if (total === 0 || actualCoins.length === 0) {
    return [];
  }

  var bestPurse = [];
  actualCoins.forEach(function(coin) {
    var availableCoins = actualCoins.slice(0);
    var currentPurse = [];

    if (total - coin >= 0) {
      var change = total - coin;
      currentPurse.push(coin);
      var tempChange = makeChange(change, availableCoins);
      currentPurse = currentPurse.concat(tempChange);
    }
    else {
      availableCoins = availableCoins.slice(1);
      currentPurse.concat(makeChange(total, availableCoins));
    }
    if (bestPurse.length === 0 || currentPurse.length < bestPurse.length){
      bestPurse = currentPurse;
    }
  });
  return bestPurse;
};
// console.log(makeChange(14, [10, 7, 1]));

var mergeSort = function(array) {
  if (array.length <= 1){
    return array;
  }
  var pivot = Math.floor(array.length / 2);
  var left = array.slice(0, pivot);
  var right = array.slice(pivot);

  return merge(mergeSort(left), mergeSort(right));
};

var merge = function(left, right) {
  var merged = [];
  while( left.length > 0 && right.length > 0 ) {
    if (left[0] < right[0]) {
      merged.push(left.shift());
    }
    else {
      merged.push(right.shift());
    }
  }
  return merged.concat(left, right);
};

// console.log(mergeSort([93,4,5,2,3,7,5,34,5,78,0]));

var subsets = function(array) {
  if (array.length === 0) {
    return [array];
  }
  var subset = subsets(array.slice(0, array.length - 1));
  var something = [];
  subset.forEach(function(elem) {
    something.push(elem.concat(array[array.length - 1]));
  });
  return subset.concat(something);
};

console.log(subsets([]));
console.log(subsets([1]));
console.log(subsets([1, 2]));
console.log(subsets([1, 2, 3]));

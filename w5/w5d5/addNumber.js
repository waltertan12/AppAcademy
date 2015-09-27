var readline = require('readline');
var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

var addNumbers = function(sum, numsLeft, callback) {
  if (numsLeft <= 0) {
    // console.log("Total Sum: " + sum);
    reader.close();
    return;
  } else {
    reader.question("Enter number:", function(numString) {
      var num = parseInt(numString);
      sum = sum + num;

      // console.log("Total Sum: " + sum);
      callback(sum);
      addNumbers(sum, numsLeft - 1, callback);
    });
  }
};


// addNumbers(0, 3, addNumbers);

addNumbers(0, 3, function (sum) {
  console.log("Total Sum: " + sum);
});
